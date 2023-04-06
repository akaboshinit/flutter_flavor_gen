import 'dart:convert';
import 'dart:io';

import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:flutter_flavor_gen_core/freezed/flavors.dart';
import 'package:flutter_flavor_gen_core/utils/fail.dart';
import 'package:flutter_flavor_gen_core/utils/log_template.dart';
import 'package:flutter_flavor_gen_core/utils/logger.dart';

Future<Flavors> getFlavors(File flavorFile) async {
  final flavorsJson = await flavorsFileToJson(flavorFile);
  final flavors =
      Flavors.fromJson(json.decode(flavorsJson) as Map<String, dynamic>);
  return flavors;
}

Future<String> flavorsFileToJson(File flavorFile) async {
  final code = flavorFile.readAsStringSync();
  final parseResult = parseString(content: code, throwIfDiagnostics: false);
  final unit = parseResult.unit;

  final flavorVariableResult = unit.declarations
      .map((declaration) {
        final isVariable = declaration is TopLevelVariableDeclaration;
        if (isVariable &&
            declaration.variables.variables.first.name.toString() ==
                'flavors') {
          final variableValue =
              declaration.variables.variables.first.initializer;
          return variableValue!.toSource();
        }
        return null;
      })
      .whereType<String>()
      .toList()
      .first;

  final sourceCode = '''
import 'dart:convert';
import 'package:flutter_flavor_gen/flutter_flavor_gen.dart';
void main() {
  final flavorsJson = $flavorVariableResult.toJson();
  final printJson = jsonEncode(flavorsJson);
  print(printJson);
}
''';
  final tempDir =
      Directory.current.createTempSync('flutter_flavor_gen_temp_dir');
  final tempFile =
      await File('${tempDir.path}/flutter_flavor_gen_temp_script.dart')
          .create();
  await tempFile.writeAsString(sourceCode);

  final result = await Process.run('dart', [tempFile.path]);

  if (result.stderr != '') {
    errorLog(
      action: 'flavorFileGet',
      error: result.stderr,
    );
    tempDir.deleteSync(recursive: true);
    fail();
  }

  final output = result.stdout;
  if (output is! String) {
    errorLog(
      action: 'flavorFileGet:NotString',
    );
    tempDir.deleteSync(recursive: true);
    fail();
  }

  L.log.info('tmp dir:${tempDir.path}');
  tempDir.deleteSync(recursive: true);

  return output;
}
