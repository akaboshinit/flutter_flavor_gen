import 'package:flutter_flavor_gen_core/functions/android/fix_android_manifest_file.dart';
import 'package:flutter_flavor_gen_core/functions/android/fix_build_gradle_file_file.dart';

Future<void> fixAndroidFiles() async {
  await fixBuildGradleFile();
  await fixAndroidManifestFile();
}
