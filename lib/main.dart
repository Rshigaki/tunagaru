import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tunagaru/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    // Riverpodでデータを受け渡しが可能な状態にするために必要
    ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        home: MyApp(),
      ),
    ),
  );
}
