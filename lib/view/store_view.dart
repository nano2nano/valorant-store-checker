import 'package:check_store/model/weapon_skinlevel/weapon_skinlevel.dart';
import 'package:check_store/utils.dart';
import 'package:check_store/view_model/store_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StoreView extends ConsumerWidget {
  const StoreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(storeViewModelProvider);
    final body = viewModel.when(
      data: (weapons) => ProviderScope(
        child: const _StoreView(),
        overrides: [weaponsProvider.overrideWithValue(weapons)],
      ),
      error: (err, stack) => Center(child: Text('error: $err')),
      loading: () => const Center(child: CircularProgressIndicator()),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(capitalize(AppLocalizations.of(context)!.store)),
      ),
      body: body,
    );
  }
}

final weaponsProvider =
    Provider<List<WeaponSkinlevel>>((ref) => throw UnimplementedError());

class _StoreView extends ConsumerWidget {
  const _StoreView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weapons = ref.watch(weaponsProvider);

    return RefreshIndicator(
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: weapons.length,
        itemBuilder: (context, index) {
          final weapon = weapons[index];
          return Card(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  child: Text(
                    weapon.displayName,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                    ),
                  ),
                ),
                Image(
                  image: NetworkImage(weapon.displayIcon),
                  fit: BoxFit.fill,
                  height: 150,
                ),
              ],
            ),
          );
        },
      ),
      onRefresh: () async {
        final viewModel = ref.watch(storeViewModelProvider.notifier);
        await viewModel.fetchSingleItemOffers();
      },
    );
  }
}
