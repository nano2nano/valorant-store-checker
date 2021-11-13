import 'package:check_store/database/account.dart';
import 'package:check_store/model/account_state.dart/account_state.dart';
import 'package:check_store/model/valorant_account/valorant_account.dart';
import 'package:check_store/repository/valorant_account.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final accountViewModelProvider =
    StateNotifierProvider<AccountViewModelProvider, AccountState>(
  (ref) => AccountViewModelProvider(
    ref.read,
    AccountRepository(AccountDatabase()),
  ),
);

class AccountViewModelProvider extends StateNotifier<AccountState> {
  AccountViewModelProvider(this._reader, this._accountRepository)
      : super(const AccountState()) {
    getAccounts();
  }

  final Reader _reader;
  final AccountRepository _accountRepository;

  Future<void> addAccount(ValorantAccount account) async {
    account = await _accountRepository.addAccount(account);
    state = state.copyWith(accounts: [account, ...state.accounts]);
  }

  Future<void> getAccounts() async {
    final accounts = await _accountRepository.getAccounts();
    state = state.copyWith(accounts: accounts);
  }

  Future<void> updateAccount(ValorantAccount newAccount) async {
    await _accountRepository.updateAccount(newAccount);
    final accounts = state.accounts
        .map(
          (account) => account.id == newAccount.id ? newAccount : account,
        )
        .toList();

    state = state.copyWith(accounts: accounts);
  }

  Future<void> deleteAccount(int id) async {
    await _accountRepository.deleteAccount(id);
    final accounts = state.accounts
        .where(
          (account) => account.id != id,
        )
        .toList();
    state = state.copyWith(accounts: accounts);
  }
}
