import 'package:check_store/model/weapon_skinlevel/weapon_skinlevel.dart';
import 'package:check_store/view_model/store_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      appBar: AppBar(title: const Text('ストア')),
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
          return ListTile(
            title: Stack(
              children: [
                Image(
                  image: NetworkImage(weapon.displayIcon),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200.withOpacity(0.5),
                  ),
                  child: Text(weapon.displayName),
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
