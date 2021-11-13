import 'package:check_store/data/remote/valorant_api.dart';
import 'package:check_store/data/remote/valorant_api_impl.dart';
import 'package:check_store/model/valorant_account/valorant_account.dart';
import 'package:check_store/model/weapon_skinlevel/weapon_skinlevel.dart';
import 'package:check_store/repository/valorant_api_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final valorantApiRespositoryProvider = Provider<ValorantApiRepository>(
  (ref) => ValorantApiRepositoryImpl(
      dataSource: ref.read(valorantApiDataSourceProvider)),
);

class ValorantApiRepositoryImpl implements ValorantApiRepository {
  ValorantApiRepositoryImpl({required ValorantApiDataSource dataSource})
      : _dataSource = dataSource;
  final ValorantApiDataSource _dataSource;

  @override
  Future<List<WeaponSkinlevel>> fetchSingleItemOffers(
      ValorantAccount account) async {
    return _dataSource.fetchSingleItemOffers(account);
  }

  @override
  Future<String> fetchUserId(String accessToken) async {
    return _dataSource.fetchUserId(accessToken);
  }

  @override
  Future<String> fetchAccessToken(ValorantAccount account) async {
    return _dataSource.fetchAccessToken(account);
  }

  @override
  Future<String> fetchEntitlementsToken(String accessToken) async {
    return _dataSource.fetchEntitlementsToken(accessToken);
  }

  @override
  Future<WeaponSkinlevel> fetchWeaponSkinLevelByUuid(String uuid) async {
    return _dataSource.fetchWeaponSkinLevelByUuid(uuid);
  }
}
