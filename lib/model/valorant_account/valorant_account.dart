import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'valorant_account.freezed.dart';
part 'valorant_account.g.dart';

@freezed
class ValorantAccount with _$ValorantAccount {
  const factory ValorantAccount({
    int? id,
    required String username,
    required String password,
    required String region,
  }) = _ValorantAccount;
  factory ValorantAccount.fromJson(Map<String, dynamic> json) =>
      _$ValorantAccountFromJson(json);
}
