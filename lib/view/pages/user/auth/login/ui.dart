import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tunagaru/view/pages/user/auth/login/controller.dart';
import 'package:tunagaru/view/pages/user/auth/registration/ui.dart';
import 'package:tunagaru/view/routes/route.gr.dart';

class LoginView extends ConsumerWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var loginState = ref.watch(loginProvider);
    var loginController = ref.read(loginProvider.notifier);

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
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
                        loginController.changeEmail(value);
                      },
                    ),
                    if (loginState.isValidated && loginState.email.isEmpty)
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
                      obscureText: !loginState.showPassword,
                      decoration: InputDecoration(
                        hintText: "××××××××",
                        suffixIcon: IconButton(
                          icon: Icon(loginState.showPassword
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            loginController.toggleShowPassword();
                          },
                        ),
                      ),
                      onChanged: (String value) {
                        loginController.changePassword(value);
                      },
                    ),
                    if (loginState.isValidated && loginState.password.isEmpty)
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
                  if (loginController.validate()) {
                    if (await loginController.signIn()) {
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
                    'サインイン',
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
                onPressed: () {
                  context.router.push(const RegistrationRoute());
                },
                child: Text(
                  'アカウントをお持ちでない方はこちら',
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  context.router.push(const ResetPasswordRoute());
                },
                child: Text(
                  'パスワードをお忘れですか？',
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
