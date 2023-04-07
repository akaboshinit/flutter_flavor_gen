import 'dart:async';

import 'package:args/args.dart';
import 'package:async/async.dart';
import 'package:flutter_flavor_gen_core/default_script.dart';
import 'package:flutter_flavor_gen_core/gen/version.gen.dart';
import 'package:flutter_flavor_gen_core/initialize_script.dart';
import 'package:flutter_flavor_gen_core/utils/fail.dart';
import 'package:flutter_flavor_gen_core/utils/log_template.dart';
import 'package:flutter_flavor_gen_core/utils/logger.dart';
import 'package:flutter_flavor_gen_core/utils/path.dart';

Future<void> mainScript(List<String> arguments) async {
  Path().setRootDir();

  final parser = ArgParser()
    ..addFlag(
      'help',
      abbr: 'h',
      help: 'Show usage information',
    )
    ..addFlag(
      'version',
      help: 'Show version number',
    )
    ..addFlag(
      'init',
      help: 'flutter_flavor_gen initialize',
    );
  // ..addMultiOption(
  //   'target',
  //   abbr: 't',
  //   help: 'Target Platform',
  //   allowed: FlavorPlatformsEnum.values.map((e) => e.name),
  // )
  // ..addOption(
  //   'file',
  //   abbr: 'f',
  //   help: 'flavors.dart path',
  // );

  final safeResult = Result(() => parser.parse(arguments));
  if (safeResult.isError) {
    logError(action: 'Parse Error', error: safeResult.asError?.error);
    endScript();
  }

  final result = safeResult.asValue!.value;

  if (result.wasParsed('help')) {
    L.log.info(parser.usage);
    endScript();
  }

  if (result.wasParsed('version')) {
    L.log.info('flutter_flavor_gen v$packageVersion');
    endScript();
  }

  final isInit = result.rest.contains('init');
  if (isInit) {
    await initializeScript(result);
    return;
  }

  await defaultScript(result);
}
