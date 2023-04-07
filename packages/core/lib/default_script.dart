import 'dart:async';
import 'dart:io';

import 'package:args/args.dart';
import 'package:async/async.dart';
import 'package:flutter_flavor_gen_core/functions/android/fix_android_files.dart';
import 'package:flutter_flavor_gen_core/functions/flavors_file_writer.dart';
import 'package:flutter_flavor_gen_core/functions/get_flavors.dart';
import 'package:flutter_flavor_gen_core/functions/ios/fix_ios_files.dart';
import 'package:flutter_flavor_gen_core/utils/log_template.dart';
import 'package:flutter_flavor_gen_core/utils/logger.dart';
import 'package:flutter_flavor_gen_core/utils/path.dart';
import 'package:path/path.dart';

Future<void> defaultScript(ArgResults arguments) async {
  L.log.success('🏁 🏁 🏁 flavor generate start 🚙 🏍️ 🏎');

  final defaultFlavorFilePath =
      Path.rootDir + joinAll(['flavors', 'flavors.dart']);
  final flavorFilePath = defaultFlavorFilePath;
  final flavorFile = File(flavorFilePath).absolute;
  final safeGetFlavors = await Result.capture(getFlavors(flavorFile));

  if (safeGetFlavors.isError || !safeGetFlavors.isValue) {
    logError(
      action: 'GetFlavors',
      error: safeGetFlavors.asError!.error,
    );
    return;
  }

  logIndent();

  final safeFlavorsWriteResult =
      await Result.capture(flavorsFileWriter(safeGetFlavors.asValue!.value));

  if (safeFlavorsWriteResult.isError) {
    logError(
      action: 'FlavorsWrite',
      error: safeFlavorsWriteResult.asError!.error,
    );
    return;
  }

  final safeFixIosFilesResult = await Result.capture(fixIosFiles());
  if (safeFixIosFilesResult.isError) {
    logError(
      action: 'FixIosFiles',
      error: safeFixIosFilesResult.asError!.error,
    );
    return;
  }

  final safeFixAndroidFilesResult = await Result.capture(fixAndroidFiles());
  if (safeFixAndroidFilesResult.isError) {
    logError(
      action: 'fixAndroidFiles',
      error: safeFixAndroidFilesResult.asError!.error,
    );
    return;
  }

  logIndent();

  L.log.info("------------'flavor list'------------");

  final flavorNames = safeGetFlavors.asValue!.value.flavors.keys.toList();
  for (final flavor in flavorNames) {
    L.log.info('''
flavor: $flavor
↓flutter flavor start-command↓
flutter run --dart-define-from-file=flavors/DO_NOT_MODIFY/define_flavor/$flavor.json
''');
  }

  L.log.info('''
in code flavor:
```
final currentFlavor = Flavor.values.byName(
  const String.fromEnvironment('flavor'),
);
enum Flavor {
  ${flavorNames.join(",\n  ")}
}
```
''');
  L.log.info('---------------------------------');

  logIndent();

  L.log.success('🕺 💃 🕺 flavor generate completed 💃 🕺 💃');

  // final repoLink = link(
  //   message: 'GitHub Repository',
  //   uri: Uri.parse('https://github.com/felangel/mason'),
  // );
  // L.log.info('To learn more, visit the $repoLink.');
}
