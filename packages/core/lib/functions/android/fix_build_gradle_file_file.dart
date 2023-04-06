import 'dart:io';

import 'package:flutter_flavor_gen_core/utils/add_file_edit_comment.dart';
import 'package:flutter_flavor_gen_core/utils/fail.dart';
import 'package:flutter_flavor_gen_core/utils/log_template.dart';
import 'package:path/path.dart' as p;

Future<void> fixBuildGradleFile() async {
  final filePath = p.Context().joinAll(['android', 'app', 'build.gradle']);
  const appId = 'android_appId';
  const appName = 'android_appName';

  const applicationIdText = 'applicationId $appId';
  const resValueText = 'resValue "string", "app_name", $appName';
  const searchText = 'versionName flutterVersionName';

  final file = File(filePath);
  final isEdited = await addFileEditComment(
    file: file,
    comment: '// flutter_flavor_gen:edit: `$applicationIdText $resValueText`',
  );
  if (isEdited) {
    return;
  }

  final lines = file.readAsLinesSync();
  final index = lines.indexWhere((line) => line.contains(searchText));
  if (index == -1 || index + 1 > lines.length) {
    logError(action: 'Failed to find $searchText in build.gradle');
    fail();
  }

  final copy = lines[index];
  final newText = copy.split(searchText)[0];
  lines
    ..insert(index + 1, '$newText$applicationIdText')
    ..insert(index + 2, '$newText$resValueText');

  final updateFile = lines.join('\n');
  file.writeAsStringSync(updateFile);
}
