## Getting Started

## step 1
```
flutter pub run flutter_flavor_gen init
```

## step 2
Edit "flavor/flavor.dart" your flavor
```
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
```

## step 3
```
flutter pub run flutter_flavor_gen
```

## step 4
```
flutter run --dart-define-from-file=flavors/DO_NOT_MODIFY/define_flavor/$flavor.json
```
