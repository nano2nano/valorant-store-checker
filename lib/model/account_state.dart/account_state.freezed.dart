// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'account_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AccountStateTearOff {
  const _$AccountStateTearOff();

  _AccountState call({List<ValorantAccount> accounts = const []}) {
    return _AccountState(
      accounts: accounts,
    );
  }
}

/// @nodoc
const $AccountState = _$AccountStateTearOff();

/// @nodoc
mixin _$AccountState {
  List<ValorantAccount> get accounts => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AccountStateCopyWith<AccountState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountStateCopyWith<$Res> {
  factory $AccountStateCopyWith(
          AccountState value, $Res Function(AccountState) then) =
      _$AccountStateCopyWithImpl<$Res>;
  $Res call({List<ValorantAccount> accounts});
}

/// @nodoc
class _$AccountStateCopyWithImpl<$Res> implements $AccountStateCopyWith<$Res> {
  _$AccountStateCopyWithImpl(this._value, this._then);

  final AccountState _value;
  // ignore: unused_field
  final $Res Function(AccountState) _then;

  @override
  $Res call({
    Object? accounts = freezed,
  }) {
    return _then(_value.copyWith(
      accounts: accounts == freezed
          ? _value.accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<ValorantAccount>,
    ));
  }
}

/// @nodoc
abstract class _$AccountStateCopyWith<$Res>
    implements $AccountStateCopyWith<$Res> {
  factory _$AccountStateCopyWith(
          _AccountState value, $Res Function(_AccountState) then) =
      __$AccountStateCopyWithImpl<$Res>;
  @override
  $Res call({List<ValorantAccount> accounts});
}

/// @nodoc
class __$AccountStateCopyWithImpl<$Res> extends _$AccountStateCopyWithImpl<$Res>
    implements _$AccountStateCopyWith<$Res> {
  __$AccountStateCopyWithImpl(
      _AccountState _value, $Res Function(_AccountState) _then)
      : super(_value, (v) => _then(v as _AccountState));

  @override
  _AccountState get _value => super._value as _AccountState;

  @override
  $Res call({
    Object? accounts = freezed,
  }) {
    return _then(_AccountState(
      accounts: accounts == freezed
          ? _value.accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<ValorantAccount>,
    ));
  }
}

/// @nodoc

class _$_AccountState with DiagnosticableTreeMixin implements _AccountState {
  const _$_AccountState({this.accounts = const []});

  @JsonKey(defaultValue: const [])
  @override
  final List<ValorantAccount> accounts;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AccountState(accounts: $accounts)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AccountState'))
      ..add(DiagnosticsProperty('accounts', accounts));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AccountState &&
            const DeepCollectionEquality().equals(other.accounts, accounts));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(accounts));

  @JsonKey(ignore: true)
  @override
  _$AccountStateCopyWith<_AccountState> get copyWith =>
      __$AccountStateCopyWithImpl<_AccountState>(this, _$identity);
}

abstract class _AccountState implements AccountState {
  const factory _AccountState({List<ValorantAccount> accounts}) =
      _$_AccountState;

  @override
  List<ValorantAccount> get accounts;
  @override
  @JsonKey(ignore: true)
  _$AccountStateCopyWith<_AccountState> get copyWith =>
      throw _privateConstructorUsedError;
}
