import 'dart:io';

import 'package:flutter_flavor_gen_core/utils/path.dart';

const sourcefileContent = '''
import 'package:flutter_flavor_gen/flutter_flavor_gen.dart';

const flavors = Flavors(
  flavors: {
    'prd': FlavorPlatforms(
      iOS: FlavorProperty(
        appName: 'example',
        appId: 'com.example.app',
      ),
      android: FlavorProperty(
        appName: 'example',
        appId: 'com.example.app',
      ),
    ),
    'stg': FlavorPlatforms(
      iOS: FlavorProperty(
        appName: '[s]example',
        appId: 'com.example.app.stg',
      ),
      android: FlavorProperty(
        appName: '[s]example',
        appId: 'com.example.app.stg',
      ),
    ),
    'dev': FlavorPlatforms(
      iOS: FlavorProperty(
        appName: '[d]example',
        appId: 'com.example.app.dev',
      ),
      android: FlavorProperty(
        appName: '[d]example',
        appId: 'com.example.app.dev',
      ),
    )
  },
);
''';

Future<void> copyFile() async {
  final file = File('${Path.rootDir}flavors/flavors.dart');
  await file.create(recursive: true);
  await file.writeAsString(sourcefileContent);
}
