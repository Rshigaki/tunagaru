// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../pages/home/ui.dart' as _i4;
import '../pages/root/ui.dart' as _i1;
import '../pages/user/auth/login/ui.dart' as _i2;
import '../pages/user/auth/registration/ui.dart' as _i3;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    RootRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.RootView());
    },
    LoginRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.LoginView());
    },
    RegistrationRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.RegistrationView());
    },
    HomeRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.HomeView());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(RootRoute.name, path: '/'),
        _i5.RouteConfig(LoginRoute.name, path: 'login'),
        _i5.RouteConfig(RegistrationRoute.name, path: 'registration'),
        _i5.RouteConfig(HomeRoute.name, path: 'home')
      ];
}

/// generated route for [_i1.RootView]
class RootRoute extends _i5.PageRouteInfo<void> {
  const RootRoute() : super(name, path: '/');

  static const String name = 'RootRoute';
}

/// generated route for [_i2.LoginView]
class LoginRoute extends _i5.PageRouteInfo<void> {
  const LoginRoute() : super(name, path: 'login');

  static const String name = 'LoginRoute';
}

/// generated route for [_i3.RegistrationView]
class RegistrationRoute extends _i5.PageRouteInfo<void> {
  const RegistrationRoute() : super(name, path: 'registration');

  static const String name = 'RegistrationRoute';
}

/// generated route for [_i4.HomeView]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute() : super(name, path: 'home');

  static const String name = 'HomeRoute';
}
