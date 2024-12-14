import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_config.freezed.dart';
part 'remote_config.g.dart';

@freezed
class RemoteConfig with _$RemoteConfig {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory RemoteConfig({
    required String id,
    required String serverUrl,
    required String websockerUrl,
    required String devPrefix,
    required String welcomeMessage,
    required String minimumVersion,
  }) = _RemoteConfig;

  factory RemoteConfig.fromJson(Map<String, dynamic> json) =>
      _$RemoteConfigFromJson(json);
}
