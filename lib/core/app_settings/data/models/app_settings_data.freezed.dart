// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_settings_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppSettingsData _$AppSettingsDataFromJson(Map<String, dynamic> json) {
  return _AppSettingsData.fromJson(json);
}

/// @nodoc
mixin _$AppSettingsData {
  String? get locale => throw _privateConstructorUsedError;
  bool? get isDarkMode => throw _privateConstructorUsedError;

  /// Serializes this AppSettingsData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppSettingsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppSettingsDataCopyWith<AppSettingsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppSettingsDataCopyWith<$Res> {
  factory $AppSettingsDataCopyWith(
          AppSettingsData value, $Res Function(AppSettingsData) then) =
      _$AppSettingsDataCopyWithImpl<$Res, AppSettingsData>;
  @useResult
  $Res call({String? locale, bool? isDarkMode});
}

/// @nodoc
class _$AppSettingsDataCopyWithImpl<$Res, $Val extends AppSettingsData>
    implements $AppSettingsDataCopyWith<$Res> {
  _$AppSettingsDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppSettingsData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = freezed,
    Object? isDarkMode = freezed,
  }) {
    return _then(_value.copyWith(
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String?,
      isDarkMode: freezed == isDarkMode
          ? _value.isDarkMode
          : isDarkMode // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppSettingsDataImplCopyWith<$Res>
    implements $AppSettingsDataCopyWith<$Res> {
  factory _$$AppSettingsDataImplCopyWith(_$AppSettingsDataImpl value,
          $Res Function(_$AppSettingsDataImpl) then) =
      __$$AppSettingsDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? locale, bool? isDarkMode});
}

/// @nodoc
class __$$AppSettingsDataImplCopyWithImpl<$Res>
    extends _$AppSettingsDataCopyWithImpl<$Res, _$AppSettingsDataImpl>
    implements _$$AppSettingsDataImplCopyWith<$Res> {
  __$$AppSettingsDataImplCopyWithImpl(
      _$AppSettingsDataImpl _value, $Res Function(_$AppSettingsDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppSettingsData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = freezed,
    Object? isDarkMode = freezed,
  }) {
    return _then(_$AppSettingsDataImpl(
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String?,
      isDarkMode: freezed == isDarkMode
          ? _value.isDarkMode
          : isDarkMode // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$AppSettingsDataImpl implements _AppSettingsData {
  _$AppSettingsDataImpl({required this.locale, required this.isDarkMode});

  factory _$AppSettingsDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppSettingsDataImplFromJson(json);

  @override
  final String? locale;
  @override
  final bool? isDarkMode;

  @override
  String toString() {
    return 'AppSettingsData(locale: $locale, isDarkMode: $isDarkMode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppSettingsDataImpl &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.isDarkMode, isDarkMode) ||
                other.isDarkMode == isDarkMode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, locale, isDarkMode);

  /// Create a copy of AppSettingsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppSettingsDataImplCopyWith<_$AppSettingsDataImpl> get copyWith =>
      __$$AppSettingsDataImplCopyWithImpl<_$AppSettingsDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppSettingsDataImplToJson(
      this,
    );
  }
}

abstract class _AppSettingsData implements AppSettingsData {
  factory _AppSettingsData(
      {required final String? locale,
      required final bool? isDarkMode}) = _$AppSettingsDataImpl;

  factory _AppSettingsData.fromJson(Map<String, dynamic> json) =
      _$AppSettingsDataImpl.fromJson;

  @override
  String? get locale;
  @override
  bool? get isDarkMode;

  /// Create a copy of AppSettingsData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppSettingsDataImplCopyWith<_$AppSettingsDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
