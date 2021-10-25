import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tunagaru/view/pages/home/ui.dart';
import 'package:tunagaru/view/pages/user/auth/ui.dart';
import 'package:tunagaru/view/pages/user/controller.dart';

class RootView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var userState = ref.watch(userProvider);
    var userController = ref.read(userProvider.notifier);
    userController.addLoginStateListener();

    return userState.currentUser != null ? const MyHomePageView() : AuthView();
  }
}
