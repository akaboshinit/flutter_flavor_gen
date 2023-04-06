import 'package:args/args.dart';
import 'package:flutter_flavor_gen_core/utils/fail.dart';

ArgResults parseArgs(List<String> arguments) {
  final parser = ArgParser()
    ..addFlag(
      'help',
      abbr: 'h',
      help: 'Show usage information',
    )
    ..addFlag(
      'version',
      abbr: 'v',
      help: 'Show version number',
    )
    ..addOption(
      'target',
      abbr: 't',
    )
    ..addOption('file', abbr: 'f');

  final result = parser.parse(arguments);

  final help = result['help'] as bool;
  if (help) {
    print(parser.usage);
    fail();
  }
  return result;
}
