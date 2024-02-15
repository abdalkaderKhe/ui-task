import 'package:flutter/material.dart';

final class BorderRadiusRight extends BorderRadius {
  BorderRadiusRight(double radiusValue) : super.only(
    topRight: Radius.circular(radiusValue),
    bottomRight: Radius.circular(radiusValue),
  );
}