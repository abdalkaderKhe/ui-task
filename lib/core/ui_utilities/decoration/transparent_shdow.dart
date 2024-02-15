import 'package:flutter/material.dart';

final class TransparentShadow extends BoxShadow {
  const TransparentShadow()
      : super(
          color: Colors.transparent,
          offset: const Offset(0, 0), // No shadow for the left side
        );
}
