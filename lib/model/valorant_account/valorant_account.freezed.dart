// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'valorant_account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ValorantAccount _$ValorantAccountFromJson(Map<String, dynamic> json) {
  return _ValorantAccount.fromJson(json);
}

/// @nodoc
class _$ValorantAccountTearOff {
  const _$ValorantAccountTearOff();

  _ValorantAccount call(
      {int? id,
      required String username,
      required String password,
      required String region}) {
    return _ValorantAccount(
      id: id,
      username: username,
      password: password,
      region: region,
    );
  }

  ValorantAccount fromJson(Map<String, Object?> json) {
    return ValorantAccount.fromJson(json);
  }
}

/// @nodoc
const $ValorantAccount = _$ValorantAccountTearOff();

/// @nodoc
mixin _$ValorantAccount {
  int? get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get region => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ValorantAccountCopyWith<ValorantAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValorantAccountCopyWith<$Res> {
  factory $ValorantAccountCopyWith(
          ValorantAccount value, $Res Function(ValorantAccount) then) =
      _$ValorantAccountCopyWithImpl<$Res>;
  $Res call({int? id, String username, String password, String region});
}

/// @nodoc
class _$ValorantAccountCopyWithImpl<$Res>
    implements $ValorantAccountCopyWith<$Res> {
  _$ValorantAccountCopyWithImpl(this._value, this._then);

  final ValorantAccount _value;
  // ignore: unused_field
  final $Res Function(ValorantAccount) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? password = freezed,
    Object? region = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      region: region == freezed
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ValorantAccountCopyWith<$Res>
    implements $ValorantAccountCopyWith<$Res> {
  factory _$ValorantAccountCopyWith(
          _ValorantAccount value, $Res Function(_ValorantAccount) then) =
      __$ValorantAccountCopyWithImpl<$Res>;
  @override
  $Res call({int? id, String username, String password, String region});
}

/// @nodoc
class __$ValorantAccountCopyWithImpl<$Res>
    extends _$ValorantAccountCopyWithImpl<$Res>
    implements _$ValorantAccountCopyWith<$Res> {
  __$ValorantAccountCopyWithImpl(
      _ValorantAccount _value, $Res Function(_ValorantAccount) _then)
      : super(_value, (v) => _then(v as _ValorantAccount));

  @override
  _ValorantAccount get _value => super._value as _ValorantAccount;

  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? password = freezed,
    Object? region = freezed,
  }) {
    return _then(_ValorantAccount(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      region: region == freezed
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ValorantAccount
    with DiagnosticableTreeMixin
    implements _ValorantAccount {
  const _$_ValorantAccount(
      {this.id,
      required this.username,
      required this.password,
      required this.region});

  factory _$_ValorantAccount.fromJson(Map<String, dynamic> json) =>
      _$$_ValorantAccountFromJson(json);

  @override
  final int? id;
  @override
  final String username;
  @override
  final String password;
  @override
  final String region;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ValorantAccount(id: $id, username: $username, password: $password, region: $region)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ValorantAccount'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('username', username))
      ..add(DiagnosticsProperty('password', password))
      ..add(DiagnosticsProperty('region', region));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ValorantAccount &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.region, region) || other.region == region));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, username, password, region);

  @JsonKey(ignore: true)
  @override
  _$ValorantAccountCopyWith<_ValorantAccount> get copyWith =>
      __$ValorantAccountCopyWithImpl<_ValorantAccount>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ValorantAccountToJson(this);
  }
}

abstract class _ValorantAccount implements ValorantAccount {
  const factory _ValorantAccount(
      {int? id,
      required String username,
      required String password,
      required String region}) = _$_ValorantAccount;

  factory _ValorantAccount.fromJson(Map<String, dynamic> json) =
      _$_ValorantAccount.fromJson;

  @override
  int? get id;
  @override
  String get username;
  @override
  String get password;
  @override
  String get region;
  @override
  @JsonKey(ignore: true)
  _$ValorantAccountCopyWith<_ValorantAccount> get copyWith =>
      throw _privateConstructorUsedError;
}
