// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) {
  return _UserInfo.fromJson(json);
}

/// @nodoc
class _$UserInfoTearOff {
  const _$UserInfoTearOff();

  _UserInfo call(
      {@JsonKey(name: 'user_id') required String userId,
      @JsonKey(name: 'entitlements_token') required String entitlementsToken,
      @JsonKey(name: 'access_token') required String accessToken}) {
    return _UserInfo(
      userId: userId,
      entitlementsToken: entitlementsToken,
      accessToken: accessToken,
    );
  }

  UserInfo fromJson(Map<String, Object?> json) {
    return UserInfo.fromJson(json);
  }
}

/// @nodoc
const $UserInfo = _$UserInfoTearOff();

/// @nodoc
mixin _$UserInfo {
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'entitlements_token')
  String get entitlementsToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'access_token')
  String get accessToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserInfoCopyWith<UserInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInfoCopyWith<$Res> {
  factory $UserInfoCopyWith(UserInfo value, $Res Function(UserInfo) then) =
      _$UserInfoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'entitlements_token') String entitlementsToken,
      @JsonKey(name: 'access_token') String accessToken});
}

/// @nodoc
class _$UserInfoCopyWithImpl<$Res> implements $UserInfoCopyWith<$Res> {
  _$UserInfoCopyWithImpl(this._value, this._then);

  final UserInfo _value;
  // ignore: unused_field
  final $Res Function(UserInfo) _then;

  @override
  $Res call({
    Object? userId = freezed,
    Object? entitlementsToken = freezed,
    Object? accessToken = freezed,
  }) {
    return _then(_value.copyWith(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      entitlementsToken: entitlementsToken == freezed
          ? _value.entitlementsToken
          : entitlementsToken // ignore: cast_nullable_to_non_nullable
              as String,
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$UserInfoCopyWith<$Res> implements $UserInfoCopyWith<$Res> {
  factory _$UserInfoCopyWith(_UserInfo value, $Res Function(_UserInfo) then) =
      __$UserInfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'entitlements_token') String entitlementsToken,
      @JsonKey(name: 'access_token') String accessToken});
}

/// @nodoc
class __$UserInfoCopyWithImpl<$Res> extends _$UserInfoCopyWithImpl<$Res>
    implements _$UserInfoCopyWith<$Res> {
  __$UserInfoCopyWithImpl(_UserInfo _value, $Res Function(_UserInfo) _then)
      : super(_value, (v) => _then(v as _UserInfo));

  @override
  _UserInfo get _value => super._value as _UserInfo;

  @override
  $Res call({
    Object? userId = freezed,
    Object? entitlementsToken = freezed,
    Object? accessToken = freezed,
  }) {
    return _then(_UserInfo(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      entitlementsToken: entitlementsToken == freezed
          ? _value.entitlementsToken
          : entitlementsToken // ignore: cast_nullable_to_non_nullable
              as String,
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserInfo with DiagnosticableTreeMixin implements _UserInfo {
  const _$_UserInfo(
      {@JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'entitlements_token') required this.entitlementsToken,
      @JsonKey(name: 'access_token') required this.accessToken});

  factory _$_UserInfo.fromJson(Map<String, dynamic> json) =>
      _$$_UserInfoFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'entitlements_token')
  final String entitlementsToken;
  @override
  @JsonKey(name: 'access_token')
  final String accessToken;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserInfo(userId: $userId, entitlementsToken: $entitlementsToken, accessToken: $accessToken)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserInfo'))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('entitlementsToken', entitlementsToken))
      ..add(DiagnosticsProperty('accessToken', accessToken));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserInfo &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.entitlementsToken, entitlementsToken) ||
                other.entitlementsToken == entitlementsToken) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, entitlementsToken, accessToken);

  @JsonKey(ignore: true)
  @override
  _$UserInfoCopyWith<_UserInfo> get copyWith =>
      __$UserInfoCopyWithImpl<_UserInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserInfoToJson(this);
  }
}

abstract class _UserInfo implements UserInfo {
  const factory _UserInfo(
      {@JsonKey(name: 'user_id')
          required String userId,
      @JsonKey(name: 'entitlements_token')
          required String entitlementsToken,
      @JsonKey(name: 'access_token')
          required String accessToken}) = _$_UserInfo;

  factory _UserInfo.fromJson(Map<String, dynamic> json) = _$_UserInfo.fromJson;

  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(name: 'entitlements_token')
  String get entitlementsToken;
  @override
  @JsonKey(name: 'access_token')
  String get accessToken;
  @override
  @JsonKey(ignore: true)
  _$UserInfoCopyWith<_UserInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
