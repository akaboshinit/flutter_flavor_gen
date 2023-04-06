import 'dart:io';

import 'package:flutter_flavor_gen_core/utils/add_file_edit_comment.dart';
import 'package:flutter_flavor_gen_core/utils/string.dart';
import 'package:path/path.dart' as p;

Future<void> fixInfoPlistFile() async {
  final filePath = p.Context().joinAll(['ios', 'Runner', 'Info.plist']);

  final file = File(filePath);
  final isEdited = await addFileEditComment(
    file: file,
    comment:
        // ignore: lines_longer_than_80_chars
        '<!-- flutter_flavor_gen:edit: `<key>CFBundleName<key><string>\$(iOS_appName)<string>` -->',
  );
  if (isEdited) {
    return;
  }

  var content = file.readAsStringSync();
  final patternA =
      RegExp(r'<key>CFBundleDisplayName<\/key>\s*<string>([^<]*)<\/string>');
  final patternB =
      RegExp(r'<key>CFBundleName<\/key>\s*<string>([^<]*)<\/string>');
  content = content.replaceAllMapped(patternA, (match) {
    final current = match.group(1);
    return match.group(0)!.replaceFirst(current!, TEMPLATE_STRING_iOS_appName);
  });
  content = content.replaceAllMapped(patternB, (match) {
    final current = match.group(1);
    return match.group(0)!.replaceFirst(current!, TEMPLATE_STRING_iOS_appName);
  });
  file.writeAsStringSync(content);
}
