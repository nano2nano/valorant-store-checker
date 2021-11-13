import 'package:check_store/model/valorant_account/valorant_account.dart';
import 'package:check_store/model/weapon_skinlevel/weapon_skinlevel.dart';

mixin ValorantApiDataSource {
  Future<WeaponSkinlevel> fetchWeaponSkinLevelByUuid(String uuid);
  Future<List<WeaponSkinlevel>> fetchSingleItemOffers(ValorantAccount account);
  Future<String> fetchUserId(String accessToken);
  Future<String> fetchAccessToken(ValorantAccount account);
  Future<String> fetchEntitlementsToken(String accessToken);
}
