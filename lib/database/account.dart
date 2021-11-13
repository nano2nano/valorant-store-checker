import 'package:check_store/database/app_database.dart';
import 'package:check_store/model/valorant_account/valorant_account.dart';

class AccountDatabase extends AppDatabase {
  final String _tableName = 'account';

  Future<List<ValorantAccount>> getAccounts() async {
    final db = await database;

    final maps = await db.query(
      _tableName,
      orderBy: 'id DESC',
    );
    if (maps.isEmpty) return [];
    return maps.map((map) => ValorantAccount.fromJson(map)).toList();
  }

  Future<ValorantAccount> insert(ValorantAccount account) async {
    final db = await database;

    final id = await db.insert(
      _tableName,
      account.toJson(),
    );
    return account.copyWith(id: id);
  }

  Future<int> update(ValorantAccount account) async {
    final db = await database;

    return await db.update(
      _tableName,
      account.toJson(),
      where: 'id = ?',
      whereArgs: [account.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await database;

    return await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
