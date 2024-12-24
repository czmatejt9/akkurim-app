// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RemoteConfigImpl _$$RemoteConfigImplFromJson(Map<String, dynamic> json) =>
    _$RemoteConfigImpl(
      id: (json['id'] as num).toInt(),
      serverUrl: json['server_url'] as String,
      websocketUrl: json['websocket_url'] as String,
      devPrefix: json['dev_prefix'] as String,
      welcomeMessage: json['welcome_message'] as String,
      minimumAppVersion: json['minimum_app_version'] as String,
    );

Map<String, dynamic> _$$RemoteConfigImplToJson(_$RemoteConfigImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'server_url': instance.serverUrl,
      'websocket_url': instance.websocketUrl,
      'dev_prefix': instance.devPrefix,
      'welcome_message': instance.welcomeMessage,
      'minimum_app_version': instance.minimumAppVersion,
    };
