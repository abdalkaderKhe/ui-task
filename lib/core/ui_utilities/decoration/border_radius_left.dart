import 'package:flutter/material.dart';

final class BorderRadiusLeft extends BorderRadius {
  BorderRadiusLeft(double radiusValue) : super.only(
    topLeft: Radius.circular(radiusValue),
    bottomLeft: Radius.circular(radiusValue),
  );
}