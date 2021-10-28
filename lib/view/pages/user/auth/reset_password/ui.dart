import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tunagaru/view/pages/user/auth/reset_password/controller.dart';

class ResetPasswordView extends ConsumerWidget {
  const ResetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var resetPasswordState = ref.watch(resetPasswordProvider);
    var resetPasswordController = ref.read(resetPasswordProvider.notifier);

    return Scaffold(
      body: Center(
        child: resetPasswordState.isLoading
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
                        'パスワード再設定',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    resetPasswordState.isMailSent
                        ? Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 60.0),
                            child: Column(
                              children: [
                                Text(
                                  'パスワード再設定用のメールを送信しました。',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(
                                  height: 60,
                                ),
                                TextButton(
                                  onPressed: () {
                                    resetPasswordController
                                        .sendResetPasswordEmail();
                                  },
                                  child: Text(
                                    '再送信',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Column(
                            children: [
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
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 60.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextFormField(
                                      decoration: const InputDecoration(
                                        hintText: "tsunagaru@example.com",
                                      ),
                                      onChanged: (String value) {
                                        resetPasswordController
                                            .changeEmail(value);
                                      },
                                    ),
                                    if (resetPasswordState.isValidated &&
                                        resetPasswordState.email.isEmpty)
                                      const Text(
                                        'メールアドレスを入力してください',
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
                                  if (resetPasswordController.validate()) {
                                    await resetPasswordController
                                        .sendResetPasswordEmail();
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
                                    '再登録',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                    const SizedBox(
                      height: 40,
                    ),
                    TextButton(
                      onPressed: () {
                        context.router.pop();
                      },
                      child: Text(
                        'サインイン画面に戻る',
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
    );
  }
}
