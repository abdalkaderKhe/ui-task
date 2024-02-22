import 'package:flutter/material.dart';

final class RightBorderRadius extends BorderRadius
{
  RightBorderRadius({required double topRight,required double bottomRight}): super.only(
  topRight: Radius.circular(topRight),
  bottomRight: Radius.circular(bottomRight),
  );
}