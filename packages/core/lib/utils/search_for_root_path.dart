import 'dart:io';

import 'package:path/path.dart';

String searchForRootPath(String directoryPath) {
  final pubspecPath = join(directoryPath, 'pubspec.yaml');
  final pubspecFile = File(pubspecPath);
  if (pubspecFile.existsSync()) {
    return directoryPath;
  }

  final parent = Directory(directoryPath).parent;
  if (parent.path == directoryPath) {
    // reached the root directory
    throw Error();
  }
  return searchForRootPath(parent.path);
}
