import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tunagaru/view/pages/home/ui.dart';
import 'package:tunagaru/view/pages/user/auth/login/ui.dart';
import 'package:tunagaru/view/pages/user/controller.dart';

class RootView extends ConsumerStatefulWidget {
  @override
  _RootViewState createState() => _RootViewState();
}

class _RootViewState extends ConsumerState {
  @override
  void initState() {
    var userController = ref.read(userProvider.notifier);
    super.initState();
    userController.addLoginStateListener();
  }

  @override
  Widget build(BuildContext context) {
    var userState = ref.watch(userProvider);
    var userController = ref.read(userProvider.notifier);

    return userState.currentUser != null ? const HomeView() : const LoginView();
  }
}
