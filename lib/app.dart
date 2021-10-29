import 'package:flutter/material.dart';
import 'package:tunagaru/view/routes/route.gr.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(252, 70, 170, 1),
        secondaryHeaderColor: const Color.fromRGBO(252, 70, 170, 0.8),
      ),
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate(),
    );
  }
}
