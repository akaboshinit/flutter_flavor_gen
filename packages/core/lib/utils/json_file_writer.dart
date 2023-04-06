import 'dart:convert';
import 'dart:io';

import 'package:flutter_flavor_gen_core/utils/logger.dart';

void jsonFileWriter({
  required String fileName,
  required Map<String, dynamic> json,
}) {
  const encoder = JsonEncoder.withIndent('    ');
  final formattedJsonString = encoder.convert(json);

  final file = File(fileName)..writeAsStringSync(formattedJsonString);

  L.log.info('json file write:\n${file.path}\n');
}
