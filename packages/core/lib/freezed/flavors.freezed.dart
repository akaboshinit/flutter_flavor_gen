// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flavors.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Flavors _$FlavorsFromJson(Map<String, dynamic> json) {
  return _Flavors.fromJson(json);
}

/// @nodoc
mixin _$Flavors {
  Map<String, FlavorPlatforms> get flavors =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FlavorsCopyWith<Flavors> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlavorsCopyWith<$Res> {
  factory $FlavorsCopyWith(Flavors value, $Res Function(Flavors) then) =
      _$FlavorsCopyWithImpl<$Res, Flavors>;
  @useResult
  $Res call({Map<String, FlavorPlatforms> flavors});
}

/// @nodoc
class _$FlavorsCopyWithImpl<$Res, $Val extends Flavors>
    implements $FlavorsCopyWith<$Res> {
  _$FlavorsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flavors = null,
  }) {
    return _then(_value.copyWith(
      flavors: null == flavors
          ? _value.flavors
          : flavors // ignore: cast_nullable_to_non_nullable
              as Map<String, FlavorPlatforms>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FlavorsCopyWith<$Res> implements $FlavorsCopyWith<$Res> {
  factory _$$_FlavorsCopyWith(
          _$_Flavors value, $Res Function(_$_Flavors) then) =
      __$$_FlavorsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, FlavorPlatforms> flavors});
}

/// @nodoc
class __$$_FlavorsCopyWithImpl<$Res>
    extends _$FlavorsCopyWithImpl<$Res, _$_Flavors>
    implements _$$_FlavorsCopyWith<$Res> {
  __$$_FlavorsCopyWithImpl(_$_Flavors _value, $Res Function(_$_Flavors) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flavors = null,
  }) {
    return _then(_$_Flavors(
      flavors: null == flavors
          ? _value._flavors
          : flavors // ignore: cast_nullable_to_non_nullable
              as Map<String, FlavorPlatforms>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Flavors implements _Flavors {
  const _$_Flavors({required final Map<String, FlavorPlatforms> flavors})
      : _flavors = flavors;

  factory _$_Flavors.fromJson(Map<String, dynamic> json) =>
      _$$_FlavorsFromJson(json);

  final Map<String, FlavorPlatforms> _flavors;
  @override
  Map<String, FlavorPlatforms> get flavors {
    if (_flavors is EqualUnmodifiableMapView) return _flavors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_flavors);
  }

  @override
  String toString() {
    return 'Flavors(flavors: $flavors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Flavors &&
            const DeepCollectionEquality().equals(other._flavors, _flavors));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_flavors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FlavorsCopyWith<_$_Flavors> get copyWith =>
      __$$_FlavorsCopyWithImpl<_$_Flavors>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FlavorsToJson(
      this,
    );
  }
}

abstract class _Flavors implements Flavors {
  const factory _Flavors(
      {required final Map<String, FlavorPlatforms> flavors}) = _$_Flavors;

  factory _Flavors.fromJson(Map<String, dynamic> json) = _$_Flavors.fromJson;

  @override
  Map<String, FlavorPlatforms> get flavors;
  @override
  @JsonKey(ignore: true)
  _$$_FlavorsCopyWith<_$_Flavors> get copyWith =>
      throw _privateConstructorUsedError;
}
