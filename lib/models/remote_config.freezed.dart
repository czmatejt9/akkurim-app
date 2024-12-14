// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remote_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RemoteConfig _$RemoteConfigFromJson(Map<String, dynamic> json) {
  return _RemoteConfig.fromJson(json);
}

/// @nodoc
mixin _$RemoteConfig {
  String get id => throw _privateConstructorUsedError;
  String get serverUrl => throw _privateConstructorUsedError;
  String get websockerUrl => throw _privateConstructorUsedError;
  String get devPrefix => throw _privateConstructorUsedError;
  String get welcomeMessage => throw _privateConstructorUsedError;
  String get minimumVersion => throw _privateConstructorUsedError;

  /// Serializes this RemoteConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RemoteConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RemoteConfigCopyWith<RemoteConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoteConfigCopyWith<$Res> {
  factory $RemoteConfigCopyWith(
          RemoteConfig value, $Res Function(RemoteConfig) then) =
      _$RemoteConfigCopyWithImpl<$Res, RemoteConfig>;
  @useResult
  $Res call(
      {String id,
      String serverUrl,
      String websockerUrl,
      String devPrefix,
      String welcomeMessage,
      String minimumVersion});
}

/// @nodoc
class _$RemoteConfigCopyWithImpl<$Res, $Val extends RemoteConfig>
    implements $RemoteConfigCopyWith<$Res> {
  _$RemoteConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RemoteConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? serverUrl = null,
    Object? websockerUrl = null,
    Object? devPrefix = null,
    Object? welcomeMessage = null,
    Object? minimumVersion = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      serverUrl: null == serverUrl
          ? _value.serverUrl
          : serverUrl // ignore: cast_nullable_to_non_nullable
              as String,
      websockerUrl: null == websockerUrl
          ? _value.websockerUrl
          : websockerUrl // ignore: cast_nullable_to_non_nullable
              as String,
      devPrefix: null == devPrefix
          ? _value.devPrefix
          : devPrefix // ignore: cast_nullable_to_non_nullable
              as String,
      welcomeMessage: null == welcomeMessage
          ? _value.welcomeMessage
          : welcomeMessage // ignore: cast_nullable_to_non_nullable
              as String,
      minimumVersion: null == minimumVersion
          ? _value.minimumVersion
          : minimumVersion // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RemoteConfigImplCopyWith<$Res>
    implements $RemoteConfigCopyWith<$Res> {
  factory _$$RemoteConfigImplCopyWith(
          _$RemoteConfigImpl value, $Res Function(_$RemoteConfigImpl) then) =
      __$$RemoteConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String serverUrl,
      String websockerUrl,
      String devPrefix,
      String welcomeMessage,
      String minimumVersion});
}

/// @nodoc
class __$$RemoteConfigImplCopyWithImpl<$Res>
    extends _$RemoteConfigCopyWithImpl<$Res, _$RemoteConfigImpl>
    implements _$$RemoteConfigImplCopyWith<$Res> {
  __$$RemoteConfigImplCopyWithImpl(
      _$RemoteConfigImpl _value, $Res Function(_$RemoteConfigImpl) _then)
      : super(_value, _then);

  /// Create a copy of RemoteConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? serverUrl = null,
    Object? websockerUrl = null,
    Object? devPrefix = null,
    Object? welcomeMessage = null,
    Object? minimumVersion = null,
  }) {
    return _then(_$RemoteConfigImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      serverUrl: null == serverUrl
          ? _value.serverUrl
          : serverUrl // ignore: cast_nullable_to_non_nullable
              as String,
      websockerUrl: null == websockerUrl
          ? _value.websockerUrl
          : websockerUrl // ignore: cast_nullable_to_non_nullable
              as String,
      devPrefix: null == devPrefix
          ? _value.devPrefix
          : devPrefix // ignore: cast_nullable_to_non_nullable
              as String,
      welcomeMessage: null == welcomeMessage
          ? _value.welcomeMessage
          : welcomeMessage // ignore: cast_nullable_to_non_nullable
              as String,
      minimumVersion: null == minimumVersion
          ? _value.minimumVersion
          : minimumVersion // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$RemoteConfigImpl implements _RemoteConfig {
  const _$RemoteConfigImpl(
      {required this.id,
      required this.serverUrl,
      required this.websockerUrl,
      required this.devPrefix,
      required this.welcomeMessage,
      required this.minimumVersion});

  factory _$RemoteConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$RemoteConfigImplFromJson(json);

  @override
  final String id;
  @override
  final String serverUrl;
  @override
  final String websockerUrl;
  @override
  final String devPrefix;
  @override
  final String welcomeMessage;
  @override
  final String minimumVersion;

  @override
  String toString() {
    return 'RemoteConfig(id: $id, serverUrl: $serverUrl, websockerUrl: $websockerUrl, devPrefix: $devPrefix, welcomeMessage: $welcomeMessage, minimumVersion: $minimumVersion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoteConfigImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.serverUrl, serverUrl) ||
                other.serverUrl == serverUrl) &&
            (identical(other.websockerUrl, websockerUrl) ||
                other.websockerUrl == websockerUrl) &&
            (identical(other.devPrefix, devPrefix) ||
                other.devPrefix == devPrefix) &&
            (identical(other.welcomeMessage, welcomeMessage) ||
                other.welcomeMessage == welcomeMessage) &&
            (identical(other.minimumVersion, minimumVersion) ||
                other.minimumVersion == minimumVersion));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, serverUrl, websockerUrl,
      devPrefix, welcomeMessage, minimumVersion);

  /// Create a copy of RemoteConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoteConfigImplCopyWith<_$RemoteConfigImpl> get copyWith =>
      __$$RemoteConfigImplCopyWithImpl<_$RemoteConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RemoteConfigImplToJson(
      this,
    );
  }
}

abstract class _RemoteConfig implements RemoteConfig {
  const factory _RemoteConfig(
      {required final String id,
      required final String serverUrl,
      required final String websockerUrl,
      required final String devPrefix,
      required final String welcomeMessage,
      required final String minimumVersion}) = _$RemoteConfigImpl;

  factory _RemoteConfig.fromJson(Map<String, dynamic> json) =
      _$RemoteConfigImpl.fromJson;

  @override
  String get id;
  @override
  String get serverUrl;
  @override
  String get websockerUrl;
  @override
  String get devPrefix;
  @override
  String get welcomeMessage;
  @override
  String get minimumVersion;

  /// Create a copy of RemoteConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoteConfigImplCopyWith<_$RemoteConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
