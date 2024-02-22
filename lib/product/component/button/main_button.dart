import 'package:flutter/material.dart';

import '../../theme/text_theme.dart';

final class MainButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const MainButton({super.key, required this.text,required this.onTap,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: DecoratedBox(
        decoration: const BoxDecoration(color: Colors.red),
        child: Center(
          child: Text(
            text,
            style:TextThemeApp.instance!.mainTextTheme(context),
          ),
        ),
      ),
    );
  }
}
