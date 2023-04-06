import 'dart:io';

Future<bool> addFileEditComment({
  required File file,
  required String comment,
}) async {
  final lines = await file.readAsLines();
  final isEdited = lines.first == comment;
  if (isEdited) {
    return true;
  }

  final updatedFile = '$comment\n${lines.join('\n')}';
  await file.writeAsString(updatedFile);
  return false;
}
