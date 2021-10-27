import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tunagaru/repository/auth.dart';
import 'package:tunagaru/view/pages/home/controller.dart';
import 'package:tunagaru/view/routes/route.gr.dart';

class HomeView extends ConsumerWidget {
  const HomeView({Key? key}) : super(key: key);
  final String title = 'test';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var homeState = ref.watch(homeProvider);
    var homeController = ref.read(homeProvider.notifier);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'ログインしました！',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            TextButton(
              child: Text(
                'ログアウト',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              onPressed: () async {
                await AuthRepository.signOut();
                Fluttertoast.showToast(msg: 'ログアウトしました');
                context.router.push(const LoginRoute());
              },
            ),
          ],
        ),
      ),
    );
  }
}
