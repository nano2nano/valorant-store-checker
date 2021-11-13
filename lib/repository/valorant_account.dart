import 'package:check_store/data/database/account.dart';
import 'package:check_store/model/valorant_account/valorant_account.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final accountRepositoryProvider =
    Provider<AccountRepository>((ref) => AccountRepository(AccountDatabase()));

class AccountRepository {
  final AccountDatabase _accountDatabase;

  AccountRepository(this._accountDatabase);
  Future<List<ValorantAccount>> getAccounts() async {
    return _accountDatabase.getAccounts();
  }

  Future<ValorantAccount> addAccount(ValorantAccount account) async {
    return _accountDatabase.insert(account);
  }

  Future<int> updateAccount(ValorantAccount account) async {
    return _accountDatabase.update(account);
  }

  Future<int> deleteAccount(int id) async {
    return _accountDatabase.delete(id);
  }
}
