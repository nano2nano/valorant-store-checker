import 'package:check_store/exception/auth_failure.dart';
import 'package:check_store/model/valorant_account/valorant_account.dart';
import 'package:check_store/model/weapon_skinlevel/weapon_skinlevel.dart';
import 'package:check_store/repository/valorant_api_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final accountProvider = StateProvider<ValorantAccount?>((ref) => null);

final storeViewModelProvider = StateNotifierProvider<StoreViewModelProvider,
    AsyncValue<List<WeaponSkinlevel>>>(
  (ref) => StoreViewModelProvider(ref),
);

class StoreViewModelProvider
    extends StateNotifier<AsyncValue<List<WeaponSkinlevel>>> {
  StoreViewModelProvider(this._ref) : super(const AsyncValue.loading()) {
    fetchSingleItemOffers(_ref.watch(accountProvider));
  }

  final Ref _ref;

  Future fetchSingleItemOffers(ValorantAccount? account) async {
    final _valorantApiRepository = _ref.read(valorantApiRespositoryProvider);
    try {
      final weapons =
          await _valorantApiRepository.fetchSingleItemOffers(account!);
      state = AsyncValue.data(weapons);
    } on AuthenticationFailure {
      state = const AsyncValue.error(AuthenticationFailure);
    } on Exception catch (e) {
      state = AsyncValue.error(e);
    }
  }
}
