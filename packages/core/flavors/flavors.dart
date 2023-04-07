// import 'package:flutter_flavor_gen/flutter_flavor_gen.dart';
import 'package:flutter_flavor_gen_core/types.dart';

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
