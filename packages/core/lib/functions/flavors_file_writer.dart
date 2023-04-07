import 'package:flutter_flavor_gen_core/extension/map.dart';
import 'package:flutter_flavor_gen_core/freezed/flavors.dart';
import 'package:flutter_flavor_gen_core/utils/json_file_writer.dart';
import 'package:flutter_flavor_gen_core/utils/path.dart';

Future<void> flavorsFileWriter(Flavors flavors) async {
  flavors.flavors.forEach((flavorName, flavorPlatforms) async {
    final json = flavorPlatforms.toJson().flatJson()
      ..addAll({'flavor': flavorName});

    final filePath =
        '${Path.rootDir}flavors/DO_NOT_MODIFY/define_flavor/$flavorName.json';
    await jsonFileWriter(filePath: filePath, json: json);
  });
}
