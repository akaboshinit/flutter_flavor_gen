import 'dart:io';

import 'package:flutter_flavor_gen_core/utils/add_file_edit_comment.dart';
import 'package:flutter_flavor_gen_core/utils/path.dart';
import 'package:path/path.dart';

Future<void> fixAndroidManifestFile() async {
  final filePath = Path.rootDir +
      joinAll(['android', 'app', 'src', 'main', 'AndroidManifest.xml']);

  final file = File(filePath);
  final isEdited = await addFileEditComment(
    file: file,
    comment:
        '<!-- flutter_flavor_gen:edit: `android:label="@string/app_name"` -->',
  );
  if (isEdited) {
    return;
  }

  const originalStringRegEx = r'android:label="([^"]+)"';
  const replaceString = 'android:label="@string/app_name"';

  var contents = file.readAsStringSync();
  contents = contents.replaceAllMapped(RegExp(originalStringRegEx), (match) {
    return replaceString;
  });
  file.writeAsStringSync(contents);
}
