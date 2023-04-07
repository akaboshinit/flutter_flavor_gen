import 'dart:io';

import 'package:async/async.dart';
import 'package:flutter_flavor_gen_core/utils/fail.dart';
import 'package:flutter_flavor_gen_core/utils/logger.dart';
import 'package:flutter_flavor_gen_core/utils/search_for_root_path.dart';

class Path {
  Path();
  static String rootDir = Directory.current.path;

  String setRootDir() {
    final safeRootPath =
        Result(() => searchForRootPath(Directory.current.path));
    if (safeRootPath.isError) {
      L.log.err('Could not find a root directory path');
      endScript();
    }
    final dir = safeRootPath.asValue!.value;
    rootDir = '$dir/';
    return dir;
  }
}
