import 'package:flutter/material.dart';

final class RightShadow extends BoxShadow {
   RightShadow({required double opacity, required double spreadRadius, required double blurRadius,
     required double x,required double y,})
      : super(
    color: Colors.grey.withOpacity(opacity),
    spreadRadius: spreadRadius,
    blurRadius: blurRadius,
    offset: Offset(x, y), // No shadow for the left side
  );
}

