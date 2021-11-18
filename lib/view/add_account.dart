import 'package:check_store/exception/auth_failure.dart';
import 'package:check_store/model/valorant_account/valorant_account.dart';
import 'package:check_store/provider/provider.dart';
import 'package:check_store/repository/valorant_api_repository_impl.dart';
import 'package:check_store/view_model/account_view_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

final usernameControllerProvider =
    StateProvider.autoDispose<TextEditingController>(
  (ref) => TextEditingController(),
);
final passwordControllerProvider =
    StateProvider.autoDispose<TextEditingController>(
  (ref) => TextEditingController(),
);

class AddAccountView extends StatelessWidget {
  const AddAccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('登録'),
      ),
      body: const _AddAccountView(),
    );
  }
}

class _AddAccountView extends ConsumerWidget {
  const _AddAccountView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Form(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 24.0),
              TextFormField(
                controller: ref.watch(usernameControllerProvider),
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
              const SizedBox(height: 24.0),
              TextFormField(
                controller: ref.watch(passwordControllerProvider),
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Password',
                ),
                obscureText: true,
              ),
              const SizedBox(height: 24.0),
              const DropDown(),
              const SizedBox(height: 24.0),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: CommonButton(
                    onPressed: _onPressed(context, ref),
                    child: const Text('登録'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void Function() _onPressed(BuildContext context, WidgetRef ref) {
    return () async {
      final account = ValorantAccount(
        username: ref.read(usernameControllerProvider).text,
        password: ref.read(passwordControllerProvider).text,
        region: ref.read(selectedRegionProvider),
      );
      try {
        await ref
            .read(valorantApiRespositoryProvider)
            .fetchAccessToken(account);
        final viewModel = ref.read(accountViewModelProvider.notifier);
        await viewModel.addAccount(account);
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          Navigator.pop(context);
        });
      } on AuthenticationFailure {
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          Fluttertoast.showToast(msg: '認証に失敗しました');
        });
      } on Exception catch (e) {
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          Fluttertoast.showToast(msg: e.toString());
        });
      }
    };
  }
}

class CommonButton extends StatelessWidget {
  const CommonButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.style,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final Widget? child;
  final ButtonStyle? style;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        onPressed: onPressed,
        child: child,
        style: style,
      ),
      height: 40,
      width: 200,
    );
  }
}

final selectedRegionProvider = StateProvider.autoDispose<String>((ref) => 'NA');
final regionDropdownMenuItemProvider = Provider<List<DropdownMenuItem<String>>>(
  (ref) => ref
      .watch(regionListProvider)
      .map(
        (e) => DropdownMenuItem(
          child: Text(e.item1),
          value: e.item2,
        ),
      )
      .toList(),
);

class DropDown extends ConsumerWidget {
  const DropDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedRegion = ref.watch(selectedRegionProvider.state);
    return DropdownButton<String>(
      items: ref.watch(regionDropdownMenuItemProvider),
      value: selectedRegion.state,
      onChanged: (value) {
        if (value == null) return;
        ref.read(selectedRegionProvider.state).state = value;
      },
    );
  }
}
