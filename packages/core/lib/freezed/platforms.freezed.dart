// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'platforms.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FlavorPlatforms _$FlavorPlatformsFromJson(Map<String, dynamic> json) {
  return _FlavorPlatforms.fromJson(json);
}

/// @nodoc
mixin _$FlavorPlatforms {
  FlavorProperty get android => throw _privateConstructorUsedError;
  FlavorProperty get iOS => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FlavorPlatformsCopyWith<FlavorPlatforms> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlavorPlatformsCopyWith<$Res> {
  factory $FlavorPlatformsCopyWith(
          FlavorPlatforms value, $Res Function(FlavorPlatforms) then) =
      _$FlavorPlatformsCopyWithImpl<$Res, FlavorPlatforms>;
  @useResult
  $Res call({FlavorProperty android, FlavorProperty iOS});

  $FlavorPropertyCopyWith<$Res> get android;
  $FlavorPropertyCopyWith<$Res> get iOS;
}

/// @nodoc
class _$FlavorPlatformsCopyWithImpl<$Res, $Val extends FlavorPlatforms>
    implements $FlavorPlatformsCopyWith<$Res> {
  _$FlavorPlatformsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? android = null,
    Object? iOS = null,
  }) {
    return _then(_value.copyWith(
      android: null == android
          ? _value.android
          : android // ignore: cast_nullable_to_non_nullable
              as FlavorProperty,
      iOS: null == iOS
          ? _value.iOS
          : iOS // ignore: cast_nullable_to_non_nullable
              as FlavorProperty,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FlavorPropertyCopyWith<$Res> get android {
    return $FlavorPropertyCopyWith<$Res>(_value.android, (value) {
      return _then(_value.copyWith(android: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FlavorPropertyCopyWith<$Res> get iOS {
    return $FlavorPropertyCopyWith<$Res>(_value.iOS, (value) {
      return _then(_value.copyWith(iOS: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FlavorPlatformsCopyWith<$Res>
    implements $FlavorPlatformsCopyWith<$Res> {
  factory _$$_FlavorPlatformsCopyWith(
          _$_FlavorPlatforms value, $Res Function(_$_FlavorPlatforms) then) =
      __$$_FlavorPlatformsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FlavorProperty android, FlavorProperty iOS});

  @override
  $FlavorPropertyCopyWith<$Res> get android;
  @override
  $FlavorPropertyCopyWith<$Res> get iOS;
}

/// @nodoc
class __$$_FlavorPlatformsCopyWithImpl<$Res>
    extends _$FlavorPlatformsCopyWithImpl<$Res, _$_FlavorPlatforms>
    implements _$$_FlavorPlatformsCopyWith<$Res> {
  __$$_FlavorPlatformsCopyWithImpl(
      _$_FlavorPlatforms _value, $Res Function(_$_FlavorPlatforms) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? android = null,
    Object? iOS = null,
  }) {
    return _then(_$_FlavorPlatforms(
      android: null == android
          ? _value.android
          : android // ignore: cast_nullable_to_non_nullable
              as FlavorProperty,
      iOS: null == iOS
          ? _value.iOS
          : iOS // ignore: cast_nullable_to_non_nullable
              as FlavorProperty,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FlavorPlatforms implements _FlavorPlatforms {
  const _$_FlavorPlatforms({required this.android, required this.iOS});

  factory _$_FlavorPlatforms.fromJson(Map<String, dynamic> json) =>
      _$$_FlavorPlatformsFromJson(json);

  @override
  final FlavorProperty android;
  @override
  final FlavorProperty iOS;

  @override
  String toString() {
    return 'FlavorPlatforms(android: $android, iOS: $iOS)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FlavorPlatforms &&
            (identical(other.android, android) || other.android == android) &&
            (identical(other.iOS, iOS) || other.iOS == iOS));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, android, iOS);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FlavorPlatformsCopyWith<_$_FlavorPlatforms> get copyWith =>
      __$$_FlavorPlatformsCopyWithImpl<_$_FlavorPlatforms>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FlavorPlatformsToJson(
      this,
    );
  }
}

abstract class _FlavorPlatforms implements FlavorPlatforms {
  const factory _FlavorPlatforms(
      {required final FlavorProperty android,
      required final FlavorProperty iOS}) = _$_FlavorPlatforms;

  factory _FlavorPlatforms.fromJson(Map<String, dynamic> json) =
      _$_FlavorPlatforms.fromJson;

  @override
  FlavorProperty get android;
  @override
  FlavorProperty get iOS;
  @override
  @JsonKey(ignore: true)
  _$$_FlavorPlatformsCopyWith<_$_FlavorPlatforms> get copyWith =>
      throw _privateConstructorUsedError;
}
