import 'package:check_store/model/valorant_account/valorant_account.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_state.freezed.dart';

@freezed
class AccountState with _$AccountState {
  const factory AccountState({
    @Default([]) List<ValorantAccount> accounts,
  }) = _AccountState;
}
