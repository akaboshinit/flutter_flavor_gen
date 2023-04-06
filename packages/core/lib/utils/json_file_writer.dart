import 'dart:convert';
import 'dart:io';

void jsonFileWriter({
  required String fileName,
  required Map<String, dynamic> json,
}) {
  const encoder = JsonEncoder.withIndent('    ');
  final formattedJsonString = encoder.convert(json);

  final file = File(fileName)..writeAsStringSync(formattedJsonString);

  print('json file write:\n${file.path}\n');
}
