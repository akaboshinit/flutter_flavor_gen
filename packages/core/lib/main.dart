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
import 'package:mason_logger/mason_logger.dart';
import 'package:path/path.dart' as p;

void mainScript(List<String> arguments) {
  unawaited(script(arguments));
}

Future<void> script(List<String> arguments) async {
  final safeResults = Result(() => parseArgs(arguments));

  if (safeResults.isError || !safeResults.isValue) {
    errorLog(
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
    errorLog(
      action: 'GetFlavors',
      error: safeGetFlavors.asError!.error,
    );
    return;
  }

  final safeFlavorsWriteResult =
      Result(() => flavorsFileWriter(safeGetFlavors.asValue!.value));

  if (safeFlavorsWriteResult.isError) {
    errorLog(
      action: 'FlavorsWrite',
      error: safeFlavorsWriteResult.asError!.error,
    );
    return;
  }

  final safeFixIosFilesResult = Result(fixIosFiles);
  if (safeFixIosFilesResult.isError) {
    errorLog(
      action: 'FixIosFiles',
      error: safeFixIosFilesResult.asError!.error,
    );
    return;
  }

  final safeFixAndroidFilesResult = Result(fixAndroidFiles);
  if (safeFixAndroidFilesResult.isError) {
    errorLog(
      action: 'fixAndroidFiles',
      error: safeFixAndroidFilesResult.asError!.error,
    );
    return;
  }

  L.log.info('''
prd\nflutter run --debug --dart-define-from-file=flavors/.NOT_EDIT/define_flavor/\$prd.json\nconst flavor = String.fromEnvironment('flavor');
dev\nflutter run --debug --dart-define-from-file=flavors/.NOT_EDIT/define_flavor/\$dev.json
''');

  L.log.success('completed!!!');

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
