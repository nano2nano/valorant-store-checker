import 'package:check_store/model/weapon_skinlevel/weapon_skinlevel.dart';
import 'package:check_store/view_model/store_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

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
        title: Text(
          toBeginningOfSentenceCase(AppLocalizations.of(context)!.store)!,
        ),
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
        itemBuilder: (context, index) => ProviderScope(
          child: const ListItem(),
          overrides: [itemProvider.overrideWithValue(weapons[index])],
        ),
      ),
      onRefresh: () async {
        final viewModel = ref.watch(storeViewModelProvider.notifier);
        await viewModel.fetchSingleItemOffers();
      },
    );
  }
}

final itemProvider =
    Provider<WeaponSkinlevel>((ref) => throw UnimplementedError());

class ListItem extends ConsumerWidget {
  const ListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weapon = ref.watch(itemProvider);
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
  }
}
