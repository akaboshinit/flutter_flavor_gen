import 'dart:async';
import 'dart:io';

import 'package:async/async.dart';
import 'package:flutter_flavor_gen_core/functions/android/fix_android_files.dart';
import 'package:flutter_flavor_gen_core/functions/flavors_file_writer.dart';
import 'package:flutter_flavor_gen_core/functions/get_flavors.dart';
import 'package:flutter_flavor_gen_core/functions/ios/fix_ios_files.dart';
import 'package:flutter_flavor_gen_core/functions/parse_args.dart';
import 'package:flutter_flavor_gen_core/utils/cast.dart';
import 'package:flutter_flavor_gen_core/utils/log_template.dart';
import 'package:flutter_flavor_gen_core/utils/logger.dart';
import 'package:path/path.dart' as p;

void mainScript(List<String> arguments) {
  unawaited(script(arguments));
}

Future<void> script(List<String> arguments) async {
  L.log.info('🏁 🏁 🏁 flavor generate start 🚙 🏍️ 🏎');

  final safeResults = Result(() => parseArgs(arguments));

  if (safeResults.isError || !safeResults.isValue) {
    logError(
      action: 'Arguments Read',
      error: safeResults.asError!.error,
    );
    return;
  }

  final results = safeResults.asValue!.value;

  // print('help: ${results['help']}');
  // print('version: ${results['version']}');
  // print('target: ${results['target']}');
  // print('Hello world: ${calculate()}!');

  final defaultFlavorFilePath =
      p.Context().joinAll(['flavors', 'flavors.dart']);
  final flavorFilePath =
      safeCast<String>(results['file']) ?? defaultFlavorFilePath;
  final flavorFile = File(flavorFilePath).absolute;
  final safeGetFlavors = await Result.capture(getFlavors(flavorFile));

  if (safeGetFlavors.isError || !safeResults.isValue) {
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

  final flavorNames = safeGetFlavors.asValue!.value.flavors.keys.toList();
  for (final flavor in flavorNames) {
    L.log.info('''
flavor: $flavor
↓flutter flavor start-command↓\nflutter run --dart-define-from-file=flavors/.NOT_EDIT/define_flavor/$flavor.json
''');
  }

  L.log.info('''
in code:
```
final currentFlavor = Flavor.values.byName(
  const String.fromEnvironment('flavor'),
);
enum Flavor {
  ${flavorNames.join(",\n  ")}
}
```
''');

  logIndent();

  L.log.success('🕺 💃 🕺 flavor generate completed 💃 🕺 💃');

  // final installProgress = L.log.progress(
  //   'Running "flutter packages get" in \$cwd',
  // );
  // L.log.detail('Running: \$cmd with \$args');
  // await Future<void>.delayed(const Duration(seconds: 3));
  // installProgress.update('Almost done');
  // await Future<void>.delayed(const Duration(seconds: 3));
  // installProgress.complete();
  // // installProgress.fail();
  // final installProgressa = L.log.progress(
  //   'Running "flutter packages get" in \$cwd',
  // );
  // L.log.detail('Running: \$cmd with \$args');
  // await Future<void>.delayed(const Duration(seconds: 3));
  // installProgressa.fail();
  // print('completed!!!');

  // final repoLink = link(
  //   message: 'GitHub Repository',
  //   uri: Uri.parse('https://github.com/felangel/mason'),
  // );
  // L.log.info('To learn more, visit the $repoLink.');
}
