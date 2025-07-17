import 'package:flutter/material.dart';

extension BorderRadiusExtension on Widget {
  borderRadiusAllExtension({required double all}) =>
      BorderRadius.all(Radius.circular(all));

  borderRadiusOnlyExtension({
    required double topLeft,
    required double topRight,
    required double bottomLeft,
    required double bottomRight,
  }) => BorderRadius.only(
    topLeft: Radius.circular(topLeft),
    topRight: Radius.circular(topRight),
    bottomLeft: Radius.circular(bottomLeft),
    bottomRight: Radius.circular(bottomRight),
  );

  borderRadiusVerticaExtension({
    required double topRadius,
    required double bottomRadius,
  }) => BorderRadius.vertical(
    bottom: Radius.circular(bottomRadius),
    top: Radius.circular(topRadius),
  );

  borderRadiusHorizontalExtension({
    required double leftRadius,
    required double rightRadius,
  }) => BorderRadius.horizontal(
    left: Radius.circular(leftRadius),
    right: Radius.circular(rightRadius),
  );
}
