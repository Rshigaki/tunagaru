import 'package:auto_route/auto_route.dart';
import 'package:tunagaru/view/pages/home/ui.dart';
import 'package:tunagaru/view/pages/root/ui.dart';
import 'package:tunagaru/view/pages/user/auth/login/ui.dart';
import 'package:tunagaru/view/pages/user/auth/registration/ui.dart';
import 'package:tunagaru/view/pages/user/auth/reset_password/ui.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      name: 'RootRoute',
      page: RootView,
      initial: true,
    ),
    AutoRoute(
      path: 'login',
      name: 'LoginRoute',
      page: LoginView,
    ),
    AutoRoute(
      path: 'registration',
      name: 'RegistrationRoute',
      page: RegistrationView,
    ),
    AutoRoute(
      path: 'reset_password',
      name: 'ResetPasswordRoute',
      page: ResetPasswordView,
    ),
    AutoRoute(
      path: 'home',
      name: 'HomeRoute',
      page: HomeView,
    ),
  ],
)
// extend the generated private router
class $AppRouter {}
