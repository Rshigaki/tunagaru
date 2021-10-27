import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tunagaru/view/pages/user/auth/registration/controller.dart';
import 'package:tunagaru/view/routes/route.gr.dart';

class RegistrationView extends ConsumerWidget {
  const RegistrationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var registrationState = ref.watch(registrationProvider);
    var registrationController = ref.read(registrationProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: registrationState.isLoading
              ? const CircularProgressIndicator()
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 40.0,
                        ),
                        child: Text(
                          'Tsunagaruへ\nようこそ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 60),
                        child: Text(
                          'email',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                hintText: "tsunagaru@example.com",
                              ),
                              onChanged: (String value) {
                                registrationController.changeEmail(value);
                              },
                            ),
                            if (registrationState.isValidated &&
                                registrationState.email.isEmpty)
                              const Text(
                                'メールアドレスを入力してください',
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 50),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 60),
                        child: Text(
                          'password',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                hintText: "××××××××",
                              ),
                              onChanged: (String value) {
                                registrationController.changePassword(value);
                              },
                            ),
                            if (registrationState.isValidated &&
                                registrationState.password.isEmpty)
                              const Text(
                                'パスワードを入力してください',
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 100),
                      TextButton(
                        onPressed: () async {
                          if (registrationController.validate()) {
                            if (await registrationController.register()) {
                              context.router.push(const HomeRoute());
                            }
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 60,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            'サインアップ',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          '利用規約に同意してサインアップします',
                          style: TextStyle(
                            fontSize: 18,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          context.router.pop();
                        },
                        child: Text(
                          'すでにアカウントをお持ちの方はこちら',
                          style: TextStyle(
                            fontSize: 18,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
