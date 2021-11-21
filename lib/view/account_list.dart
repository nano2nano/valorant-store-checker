import 'package:check_store/model/valorant_account/valorant_account.dart';
import 'package:check_store/view/store_view.dart';
import 'package:check_store/view_model/account_view_model.dart';
import 'package:check_store/view_model/store_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class AccountListView extends StatelessWidget {
  const AccountListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          toBeginningOfSentenceCase(AppLocalizations.of(context)!.user)!,
        ),
      ),
      body: const AccountList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add_account');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class AccountList extends ConsumerWidget {
  const AccountList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(accountViewModelProvider);

    return ListView.builder(
      itemCount: state.accounts.length,
      itemBuilder: (context, index) {
        final account = state.accounts[index];
        return ProviderScope(
          child: const AccountListItem(),
          overrides: [accountProviderForAccountList.overrideWithValue(account)],
        );
      },
    );
  }
}

final accountProviderForAccountList =
    Provider<ValorantAccount>((ref) => throw UnimplementedError());

class AccountListItem extends ConsumerWidget {
  const AccountListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final account = ref.watch(accountProviderForAccountList);
    return Slidable(
      endActionPane: ActionPane(
        extentRatio: 0.3,
        motion: const BehindMotion(),
        children: [
          SlidableAction(
            onPressed: (context) async {
              await ref
                  .read(accountViewModelProvider.notifier)
                  .deleteAccount(account.id!);
            },
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          )
        ],
      ),
      child: ListTile(
        title: Text(account.username),
        onTap: () async {
          ref.read(accountProvider.state).state = account;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const StoreView(),
            ),
          );
        },
      ),
    );
  }
}
