import 'package:auto_route/auto_route.dart';
import 'package:tunagaru/app.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: MyHomePage, initial: true),
  ],
)
// extend the generated private router
class $AppRouter {}
