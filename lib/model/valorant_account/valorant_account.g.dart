// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'valorant_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ValorantAccount _$$_ValorantAccountFromJson(Map<String, dynamic> json) =>
    _$_ValorantAccount(
      id: json['id'] as int?,
      username: json['username'] as String,
      password: json['password'] as String,
      region: json['region'] as String,
    );

Map<String, dynamic> _$$_ValorantAccountToJson(_$_ValorantAccount instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'password': instance.password,
      'region': instance.region,
    };
