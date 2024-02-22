import 'package:flutter/material.dart';
import 'color_scheme.dart';

ThemeData appTheme(BuildContext context) {
  return ThemeData(
    scaffoldBackgroundColor: ColorSchemeApp.instance!.gray,
    appBarTheme: AppBarTheme(
      titleTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Colors.grey.shade800, fontWeight: FontWeight.bold),
      iconTheme: IconThemeData(color: Colors.grey.shade700)
    ),
    useMaterial3: true,
  );
}