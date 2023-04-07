import 'package:flutter_flavor_gen_core/freezed/flavor_property.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'platforms.freezed.dart';
part 'platforms.g.dart';

enum FlavorPlatformsEnum { android, iOS }

@freezed
abstract class FlavorPlatforms with _$FlavorPlatforms {
  const factory FlavorPlatforms({
    required FlavorProperty android,
    required FlavorProperty iOS,
    // required FlavorProperty macOS,
    // required FlavorProperty linux,
    // required FlavorProperty windows,
    // required FlavorProperty fuchsia,
  }) = _FlavorPlatforms;

  factory FlavorPlatforms.fromJson(Map<String, dynamic> json) =>
      _$FlavorPlatformsFromJson(json);
}
