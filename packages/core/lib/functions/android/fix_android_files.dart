import 'package:flutter_flavor_gen_core/functions/android/fix_android_manifest_file.dart';
import 'package:flutter_flavor_gen_core/functions/android/fix_build_gradle_file_file.dart';

void fixAndroidFiles() {
  fixBuildGradleFile();
  fixAndroidManifestFile();
}
