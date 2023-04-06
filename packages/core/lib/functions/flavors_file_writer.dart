import 'package:flutter_flavor_gen_core/extension/map.dart';
import 'package:flutter_flavor_gen_core/freezed/flavors.dart';
import 'package:flutter_flavor_gen_core/utils/json_file_writer.dart';

Future<void> flavorsFileWriter(Flavors flavors) async {
  flavors.flavors.forEach((flavorName, flavorPlatforms) async {
    final json = flavorPlatforms.toJson().flatJson()
      ..addAll({'flavor': flavorName});

    final fileName = 'flavors/.NOT_EDIT/define_flavor/$flavorName.json';
    await jsonFileWriter(fileName: fileName, json: json);
  });
}
