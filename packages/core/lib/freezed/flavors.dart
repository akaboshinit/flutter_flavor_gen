import 'package:flutter_flavor_gen_core/freezed/platforms.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'flavors.freezed.dart';
part 'flavors.g.dart';

@freezed
abstract class Flavors with _$Flavors {
  const factory Flavors({
    required Map<String, FlavorPlatforms> flavors,
  }) = _Flavors;

  factory Flavors.fromJson(Map<String, dynamic> json) =>
      _$FlavorsFromJson(json);
}
