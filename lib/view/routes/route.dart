import 'package:auto_route/auto_route.dart';
import 'package:tunagaru/view/pages/root/ui.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: RootView, initial: true),
  ],
)
// extend the generated private router
class $AppRouter {}
