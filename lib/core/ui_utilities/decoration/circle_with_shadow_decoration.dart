import 'package:flutter/material.dart';

final class CircleWithShadowDecoration extends BoxDecoration {
  CircleWithShadowDecoration({required double spreadRadius,required double blurRadius,required double opacity,required double x,required  double y,required double radius})
      : super(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(opacity),
              spreadRadius: spreadRadius,
              blurRadius: blurRadius,
              offset:Offset(x, y), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(radius),
        );
}
