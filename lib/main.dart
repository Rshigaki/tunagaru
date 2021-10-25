import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tunagaru/app.dart';

void main() {
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
