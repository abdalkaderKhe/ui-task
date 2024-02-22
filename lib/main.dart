import 'package:flutter/material.dart';
import 'package:flutter_ui_showcase_test/product/navigation/router.dart';
import 'package:flutter_ui_showcase_test/product/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter UI Showcase Test',
      routerConfig: AppNavigation.router,
      theme: appTheme(context),
    );
  }
}

