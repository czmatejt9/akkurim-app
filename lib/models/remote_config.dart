import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_config.freezed.dart';
part 'remote_config.g.dart';

@freezed
class RemoteConfig with _$RemoteConfig {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory RemoteConfig({
    required int id,
    required String serverUrl,
    required String websocketUrl,
    required String devPrefix,
    required String welcomeMessage,
    required String minimumAppVersion,
  }) = _RemoteConfig;

  factory RemoteConfig.fromJson(Map<String, dynamic> json) =>
      _$RemoteConfigFromJson(json);
}
