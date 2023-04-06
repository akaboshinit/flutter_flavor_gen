import 'package:freezed_annotation/freezed_annotation.dart';

part 'flavor_property.freezed.dart';
part 'flavor_property.g.dart';

@freezed
abstract class FlavorProperty with _$FlavorProperty {
  const factory FlavorProperty({
    required String appName,
    required String appId,
  }) = _FlavorProperty;

  factory FlavorProperty.fromJson(Map<String, dynamic> json) =>
      _$FlavorPropertyFromJson(json);
}
