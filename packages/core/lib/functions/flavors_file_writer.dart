import 'package:flutter_flavor_gen_core/extension/map.dart';
import 'package:flutter_flavor_gen_core/freezed/flavors.dart';
import 'package:flutter_flavor_gen_core/utils/json_file_writer.dart';

void flavorsFileWriter(Flavors flavors) {
  flavors.flavors.forEach((flavorName, flavorPlatforms) {
    final json = flavorPlatforms.toJson().flatJson()
      ..addAll({'flavor': flavorName});

    final fileName = 'flavors/.NOT_EDIT/define_flavor/$flavorName.json';
    jsonFileWriter(fileName: fileName, json: json);
  });
}
