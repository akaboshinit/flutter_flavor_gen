import 'dart:io';

import 'package:flutter_flavor_gen_core/utils/add_file_edit_comment.dart';
import 'package:flutter_flavor_gen_core/utils/path.dart';
import 'package:flutter_flavor_gen_core/utils/string.dart';
import 'package:path/path.dart';

Future<void> fixProjectPbxprojFile() async {
  final filePath =
      Path.rootDir + joinAll(['ios', 'Runner.xcodeproj', 'project.pbxproj']);

  final file = File(filePath);
  final isEdited = await addFileEditComment(
    file: file,
    comment:
        '// flutter_flavor_gen:edit: `PRODUCT_BUNDLE_IDENTIFIER = "\$(iOS_appId)";`',
  );
  if (isEdited) {
    return;
  }

  const originalString = r'PRODUCT_BUNDLE_IDENTIFIER = [^;]+;';
  const replacementString =
      'PRODUCT_BUNDLE_IDENTIFIER = "$TEMPLATE_STRING_iOS_appId";';
  var contents = file.readAsStringSync();
  contents = contents.replaceAllMapped(RegExp(originalString), (match) {
    return replacementString;
  });
  file.writeAsStringSync(contents);
}
