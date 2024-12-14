// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RemoteConfigImpl _$$RemoteConfigImplFromJson(Map<String, dynamic> json) =>
    _$RemoteConfigImpl(
      id: json['id'] as String,
      serverUrl: json['server_url'] as String,
      websockerUrl: json['websocker_url'] as String,
      devPrefix: json['dev_prefix'] as String,
      welcomeMessage: json['welcome_message'] as String,
      minimumVersion: json['minimum_version'] as String,
    );

Map<String, dynamic> _$$RemoteConfigImplToJson(_$RemoteConfigImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'server_url': instance.serverUrl,
      'websocker_url': instance.websockerUrl,
      'dev_prefix': instance.devPrefix,
      'welcome_message': instance.welcomeMessage,
      'minimum_version': instance.minimumVersion,
    };
