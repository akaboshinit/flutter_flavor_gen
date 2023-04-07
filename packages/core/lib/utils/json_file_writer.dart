import 'dart:convert';
import 'dart:io';

import 'package:flutter_flavor_gen_core/utils/log_template.dart';
import 'package:flutter_flavor_gen_core/utils/logger.dart';

Future<void> jsonFileWriter({
  required String filePath,
  required Map<String, dynamic> json,
}) async {
  const encoder = JsonEncoder.withIndent('    ');
  final formattedJsonString = encoder.convert(json);

  final file = File(filePath);

  final progress = L.log.progress(
    'Running "write file: ${file.path}"',
  );

  logIndent();

  try {
    await file.create(recursive: true);
    await file.writeAsString(
      formattedJsonString,
    );
    progress.complete('Generated file: ${file.path}');
  } on Exception catch (e) {
    logError(
      action: 'Generated failed: ${file.path}',
      error: e,
      progress: progress,
    );
  }
}
