import 'package:flutter_flavor_gen_core/functions/ios/fix_info_plist_file.dart';
import 'package:flutter_flavor_gen_core/functions/ios/fix_pbxproj_file.dart';

void fixIosFiles() {
  fixInfoPlistFile();
  fixProjectPbxprojFile();
}
