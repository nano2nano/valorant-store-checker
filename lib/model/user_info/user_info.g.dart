// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserInfo _$$_UserInfoFromJson(Map<String, dynamic> json) => _$_UserInfo(
      userId: json['user_id'] as String,
      entitlementsToken: json['entitlements_token'] as String,
      accessToken: json['access_token'] as String,
    );

Map<String, dynamic> _$$_UserInfoToJson(_$_UserInfo instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'entitlements_token': instance.entitlementsToken,
      'access_token': instance.accessToken,
    };
