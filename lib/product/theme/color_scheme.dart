import 'package:flutter/material.dart';

class ColorSchemeApp {
  ColorSchemeApp._init();
  static ColorSchemeApp? _instace;
  static ColorSchemeApp? get instance {
    _instace ??= ColorSchemeApp._init();
    return _instace;
  }

  final Color gray = const Color.fromRGBO(250, 250, 250, 1);
  final Color grayLight = const Color.fromRGBO(234, 234, 234, 1);
  final Color grayDark = Colors.grey.shade800;

}