// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flavors.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Flavors _$$_FlavorsFromJson(Map<String, dynamic> json) => _$_Flavors(
      flavors: (json['flavors'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, FlavorPlatforms.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$$_FlavorsToJson(_$_Flavors instance) =>
    <String, dynamic>{
      'flavors': instance.flavors,
    };
