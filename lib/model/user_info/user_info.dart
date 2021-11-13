import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info.freezed.dart';
part 'user_info.g.dart';

@freezed
class UserInfo with _$UserInfo {
  const factory UserInfo({
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'entitlements_token') required String entitlementsToken,
    @JsonKey(name: 'access_token') required String accessToken,
  }) = _UserInfo;
  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);
}
