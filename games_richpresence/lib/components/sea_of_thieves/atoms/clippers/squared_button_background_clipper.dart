import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';


class SquaredButtonBackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width * 0.07, 0);
    path.cubicTo(size.width * 0.07, 0, 0, size.height * 0.02, 0, size.height * 0.02);
    path.cubicTo(0, size.height * 0.02, size.width * 0.03, size.height * 0.26, size.width * 0.03, size.height * 0.26);
    path.cubicTo(size.width * 0.03, size.height * 0.26, size.width * 0.03, size.height * 0.42, size.width * 0.03,
        size.height * 0.42);
    path.cubicTo(size.width * 0.03, size.height * 0.42, size.width * 0.01, size.height * 0.67, size.width * 0.01,
        size.height * 0.67);
    path.cubicTo(size.width * 0.01, size.height * 0.67, size.width * 0.03, size.height * 0.76, size.width * 0.03,
        size.height * 0.76);
    path.cubicTo(size.width * 0.03, size.height * 0.76, 0, size.height * 0.78, 0, size.height * 0.78);
    path.cubicTo(0, size.height * 0.8, 0, size.height * 0.85, 0, size.height * 0.86);
    path.cubicTo(size.width * 0.01, size.height * 0.88, size.width * 0.01, size.height * 0.94, size.width * 0.02,
        size.height * 0.97);
    path.cubicTo(size.width * 0.02, size.height * 0.97, size.width * 0.16, size.height, size.width * 0.16, size.height);
    path.cubicTo(
        size.width * 0.16, size.height, size.width * 0.37, size.height * 0.97, size.width * 0.37, size.height * 0.97);
    path.cubicTo(size.width * 0.37, size.height * 0.97, size.width * 0.92, size.height, size.width * 0.92, size.height);
    path.cubicTo(size.width * 0.92, size.height, size.width * 0.98, size.height, size.width * 0.98, size.height);
    path.cubicTo(size.width * 0.98, size.height, size.width, size.height * 0.82, size.width, size.height * 0.82);
    path.cubicTo(
        size.width, size.height * 0.82, size.width * 0.97, size.height * 0.81, size.width * 0.97, size.height * 0.81);
    path.cubicTo(size.width * 0.97, size.height * 0.81, size.width, size.height * 0.74, size.width, size.height * 0.74);
    path.cubicTo(size.width, size.height * 0.74, size.width, size.height * 0.7, size.width, size.height * 0.7);
    path.cubicTo(size.width, size.height * 0.7, size.width, size.height * 0.53, size.width, size.height * 0.53);
    path.cubicTo(
        size.width, size.height * 0.53, size.width * 0.97, size.height * 0.4, size.width * 0.97, size.height * 0.4);
    path.cubicTo(size.width * 0.97, size.height * 0.4, size.width * 0.96, size.height * 0.39, size.width * 0.96,
        size.height * 0.39);
    path.cubicTo(size.width * 0.96, size.height * 0.39, size.width, size.height * 0.19, size.width, size.height * 0.19);
    path.cubicTo(
        size.width, size.height * 0.19, size.width * 0.97, size.height * 0.16, size.width * 0.97, size.height * 0.16);
    path.cubicTo(size.width * 0.97, size.height * 0.16, size.width * 0.98, size.height * 0.09, size.width * 0.98,
        size.height * 0.09);
    path.cubicTo(size.width * 0.98, size.height * 0.09, size.width, size.height * 0.07, size.width, size.height * 0.07);
    path.cubicTo(size.width, size.height * 0.07, size.width * 0.91, 0, size.width * 0.91, 0);
    path.cubicTo(size.width * 0.91, 0, size.width * 0.77, size.height * 0.03, size.width * 0.77, size.height * 0.03);
    path.cubicTo(size.width * 0.67, size.height * 0.02, size.width * 0.48, size.height * 0.01, size.width * 0.48,
        size.height * 0.01);
    path.cubicTo(size.width * 0.47, size.height * 0.01, size.width / 5, size.height * 0.01, size.width * 0.07, 0);

    return path;
  }

  Path _flip(Path path, double width) {
    final m = Matrix4.identity()
      ..translate(width)
      ..rotateY(pi);
    return path.transform(m.storage);
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}
