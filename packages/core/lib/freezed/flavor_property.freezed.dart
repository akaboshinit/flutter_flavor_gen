// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flavor_property.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FlavorProperty _$FlavorPropertyFromJson(Map<String, dynamic> json) {
  return _FlavorProperty.fromJson(json);
}

/// @nodoc
mixin _$FlavorProperty {
  String get appName => throw _privateConstructorUsedError;
  String get appId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FlavorPropertyCopyWith<FlavorProperty> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlavorPropertyCopyWith<$Res> {
  factory $FlavorPropertyCopyWith(
          FlavorProperty value, $Res Function(FlavorProperty) then) =
      _$FlavorPropertyCopyWithImpl<$Res, FlavorProperty>;
  @useResult
  $Res call({String appName, String appId});
}

/// @nodoc
class _$FlavorPropertyCopyWithImpl<$Res, $Val extends FlavorProperty>
    implements $FlavorPropertyCopyWith<$Res> {
  _$FlavorPropertyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appName = null,
    Object? appId = null,
  }) {
    return _then(_value.copyWith(
      appName: null == appName
          ? _value.appName
          : appName // ignore: cast_nullable_to_non_nullable
              as String,
      appId: null == appId
          ? _value.appId
          : appId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FlavorPropertyCopyWith<$Res>
    implements $FlavorPropertyCopyWith<$Res> {
  factory _$$_FlavorPropertyCopyWith(
          _$_FlavorProperty value, $Res Function(_$_FlavorProperty) then) =
      __$$_FlavorPropertyCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String appName, String appId});
}

/// @nodoc
class __$$_FlavorPropertyCopyWithImpl<$Res>
    extends _$FlavorPropertyCopyWithImpl<$Res, _$_FlavorProperty>
    implements _$$_FlavorPropertyCopyWith<$Res> {
  __$$_FlavorPropertyCopyWithImpl(
      _$_FlavorProperty _value, $Res Function(_$_FlavorProperty) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appName = null,
    Object? appId = null,
  }) {
    return _then(_$_FlavorProperty(
      appName: null == appName
          ? _value.appName
          : appName // ignore: cast_nullable_to_non_nullable
              as String,
      appId: null == appId
          ? _value.appId
          : appId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FlavorProperty implements _FlavorProperty {
  const _$_FlavorProperty({required this.appName, required this.appId});

  factory _$_FlavorProperty.fromJson(Map<String, dynamic> json) =>
      _$$_FlavorPropertyFromJson(json);

  @override
  final String appName;
  @override
  final String appId;

  @override
  String toString() {
    return 'FlavorProperty(appName: $appName, appId: $appId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FlavorProperty &&
            (identical(other.appName, appName) || other.appName == appName) &&
            (identical(other.appId, appId) || other.appId == appId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, appName, appId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FlavorPropertyCopyWith<_$_FlavorProperty> get copyWith =>
      __$$_FlavorPropertyCopyWithImpl<_$_FlavorProperty>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FlavorPropertyToJson(
      this,
    );
  }
}

abstract class _FlavorProperty implements FlavorProperty {
  const factory _FlavorProperty(
      {required final String appName,
      required final String appId}) = _$_FlavorProperty;

  factory _FlavorProperty.fromJson(Map<String, dynamic> json) =
      _$_FlavorProperty.fromJson;

  @override
  String get appName;
  @override
  String get appId;
  @override
  @JsonKey(ignore: true)
  _$$_FlavorPropertyCopyWith<_$_FlavorProperty> get copyWith =>
      throw _privateConstructorUsedError;
}
