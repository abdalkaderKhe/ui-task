import 'package:flutter/material.dart';
import 'package:flutter_ui_showcase_test/product/theme/color_scheme.dart';

class TextThemeApp {
  TextThemeApp._init();

  static TextThemeApp? _instance;

  static TextThemeApp? get instance {
    _instance ??= TextThemeApp._init();
    return _instance;
  }

  TextStyle greyDarkTitleLarge(BuildContext context) {
    return Theme.of(context).textTheme.titleLarge!.copyWith(
          color: ColorSchemeApp.instance!.grayDark,
          fontWeight: FontWeight.w400,
        );
  }

  TextStyle greyTitleLarge(BuildContext context) {
    return Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.grey);
  }

  TextStyle greyTitleMedium(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .titleMedium!
        .copyWith(color: Colors.grey, fontWeight: FontWeight.w400);
  }

  TextStyle boldTitleLarge(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .titleLarge!
        .copyWith(fontWeight: FontWeight.bold);
  }

  TextStyle redHeadlineLarge(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .headlineLarge!
        .copyWith(color: Colors.red);
  }

  TextStyle tagsTextTheme(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .bodyLarge!
        .copyWith(
        color: Colors.grey,
        height: 1.8
    );
  }

  TextStyle mainTextTheme(BuildContext context) {
    return  Theme.of(context).textTheme.titleMedium!.copyWith(
      color: Colors.white,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle boldTitleMediumTextTheme(BuildContext context) {
    return  Theme.of(context)
        .textTheme
        .titleMedium!
        .copyWith(fontWeight: FontWeight.bold);
  }

  TextStyle orangeTitleMediumTextTheme(BuildContext context) {
    return  Theme.of(context)
        .textTheme
        .titleMedium!
        .copyWith(color: Colors.orange);
  }

}
