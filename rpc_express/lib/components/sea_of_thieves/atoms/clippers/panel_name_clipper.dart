import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class PanelNameClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width, size.height * 0.92);
    path.cubicTo(size.width, size.height * 0.91, size.width, size.height * 0.89, size.width, size.height * 0.88);
    path.cubicTo(size.width, size.height * 0.81, size.width, size.height * 0.74, size.width, size.height * 0.67);
    path.cubicTo(size.width, size.height * 0.67, size.width, size.height * 0.67, size.width, size.height * 0.67);
    path.cubicTo(size.width, size.height * 0.67, size.width, size.height * 0.66, size.width, size.height * 0.65);
    path.cubicTo(size.width, size.height * 0.6, size.width, size.height * 0.56, size.width, size.height * 0.51);
    path.cubicTo(size.width, size.height * 0.51, size.width, size.height / 2, size.width, size.height / 2);
    path.cubicTo(size.width, size.height / 2, size.width, size.height * 0.49, size.width, size.height * 0.49);
    path.cubicTo(size.width, size.height * 0.49, size.width, size.height * 0.44, size.width, size.height * 0.44);
    path.cubicTo(size.width, size.height * 0.43, size.width, size.height * 0.43, size.width, size.height * 0.43);
    path.cubicTo(size.width, size.height * 0.32, size.width, size.height * 0.22, size.width, size.height * 0.11);
    path.cubicTo(size.width, size.height * 0.11, size.width, size.height * 0.08, size.width, size.height * 0.07);
    path.cubicTo(size.width, size.height * 0.06, size.width, size.height * 0.06, size.width, size.height * 0.05);
    path.cubicTo(size.width, size.height * 0.04, size.width, size.height * 0.04, size.width, size.height * 0.04);
    path.cubicTo(size.width, size.height * 0.04, size.width, size.height * 0.04, size.width, size.height * 0.04);
    path.cubicTo(size.width, size.height * 0.03, size.width, size.height * 0.03, size.width, size.height * 0.02);
    path.cubicTo(size.width * 0.98, size.height * 0.03, size.width * 0.97, size.height * 0.03, size.width * 0.96,
        size.height * 0.04);
    path.cubicTo(size.width * 0.93, size.height * 0.04, size.width * 0.9, size.height * 0.04, size.width * 0.88,
        size.height * 0.03);
    path.cubicTo(size.width * 0.87, size.height * 0.03, size.width * 0.86, size.height * 0.03, size.width * 0.85,
        size.height * 0.03);
    path.cubicTo(size.width * 0.84, size.height * 0.03, size.width * 0.84, size.height * 0.03, size.width * 0.84,
        size.height * 0.03);
    path.cubicTo(size.width * 0.81, size.height * 0.04, size.width * 0.79, size.height * 0.04, size.width * 0.76,
        size.height * 0.03);
    path.cubicTo(size.width * 0.73, size.height * 0.03, size.width * 0.71, size.height * 0.03, size.width * 0.68,
        size.height * 0.03);
    path.cubicTo(size.width * 0.68, size.height * 0.03, size.width * 0.68, size.height * 0.03, size.width * 0.68,
        size.height * 0.03);
    path.cubicTo(size.width * 0.68, size.height * 0.03, size.width * 0.68, size.height * 0.03, size.width * 0.68,
        size.height * 0.03);
    path.cubicTo(size.width * 0.66, size.height * 0.03, size.width * 0.65, size.height * 0.03, size.width * 0.63,
        size.height * 0.04);
    path.cubicTo(size.width * 0.63, size.height * 0.04, size.width * 0.62, size.height * 0.04, size.width * 0.62,
        size.height * 0.04);
    path.cubicTo(size.width * 0.62, size.height * 0.04, size.width * 0.61, size.height * 0.04, size.width * 0.6,
        size.height * 0.04);
    path.cubicTo(size.width * 0.6, size.height * 0.03, size.width * 0.59, size.height * 0.03, size.width * 0.59,
        size.height * 0.03);
    path.cubicTo(size.width * 0.59, size.height * 0.03, size.width * 0.58, size.height * 0.03, size.width * 0.57,
        size.height * 0.04);
    path.cubicTo(size.width * 0.56, size.height * 0.03, size.width * 0.54, size.height * 0.03, size.width * 0.53,
        size.height * 0.03);
    path.cubicTo(size.width * 0.51, size.height * 0.02, size.width * 0.48, size.height * 0.03, size.width * 0.46,
        size.height * 0.01);
    path.cubicTo(size.width * 0.46, size.height * 0.02, size.width * 0.46, size.height * 0.02, size.width * 0.45,
        size.height * 0.02);
    path.cubicTo(size.width * 0.45, size.height * 0.02, size.width * 0.45, size.height * 0.02, size.width * 0.45,
        size.height * 0.02);
    path.cubicTo(size.width * 0.45, size.height * 0.02, size.width * 0.45, size.height * 0.02, size.width * 0.44,
        size.height * 0.02);
    path.cubicTo(size.width * 0.44, size.height * 0.02, size.width * 0.43, size.height * 0.03, size.width * 0.42,
        size.height * 0.03);
    path.cubicTo(size.width * 0.37, size.height * 0.02, size.width * 0.32, size.height * 0.02, size.width * 0.27,
        size.height * 0.02);
    path.cubicTo(size.width * 0.27, size.height * 0.02, size.width * 0.26, size.height * 0.02, size.width * 0.26,
        size.height * 0.02);
    path.cubicTo(size.width * 0.26, size.height * 0.02, size.width * 0.26, size.height * 0.02, size.width * 0.26,
        size.height * 0.02);
    path.cubicTo(size.width * 0.24, size.height * 0.02, size.width * 0.23, size.height * 0.01, size.width * 0.22,
        size.height * 0.01);
    path.cubicTo(
        size.width * 0.22, size.height * 0.01, size.width / 5, size.height * 0.01, size.width / 5, size.height * 0.01);
    path.cubicTo(
        size.width / 5, size.height * 0.01, size.width / 5, size.height * 0.01, size.width / 5, size.height * 0.01);
    path.cubicTo(size.width * 0.19, size.height * 0.01, size.width * 0.18, size.height * 0.01, size.width * 0.17,
        size.height * 0.02);
    path.cubicTo(size.width * 0.17, size.height * 0.02, size.width * 0.17, size.height * 0.02, size.width * 0.16,
        size.height * 0.02);
    path.cubicTo(size.width * 0.15, size.height * 0.02, size.width * 0.13, size.height * 0.01, size.width * 0.12,
        size.height * 0.01);
    path.cubicTo(size.width * 0.12, size.height * 0.01, size.width * 0.11, size.height * 0.01, size.width * 0.11,
        size.height * 0.01);
    path.cubicTo(size.width * 0.11, size.height * 0.01, size.width * 0.1, size.height * 0.01, size.width * 0.1,
        size.height * 0.01);
    path.cubicTo(size.width * 0.09, size.height * 0.01, size.width * 0.08, size.height * 0.01, size.width * 0.06,
        size.height * 0.01);
    path.cubicTo(size.width * 0.06, size.height * 0.01, size.width * 0.06, size.height * 0.01, size.width * 0.06,
        size.height * 0.01);
    path.cubicTo(size.width * 0.06, size.height * 0.01, size.width * 0.05, size.height * 0.01, size.width * 0.05,
        size.height * 0.01);
    path.cubicTo(size.width * 0.05, size.height * 0.01, size.width * 0.05, size.height * 0.01, size.width * 0.05,
        size.height * 0.01);
    path.cubicTo(size.width * 0.04, size.height * 0.01, size.width * 0.04, size.height * 0.01, size.width * 0.03,
        size.height * 0.01);
    path.cubicTo(size.width * 0.02, 0, size.width * 0.01, -0.01, 0, size.height * 0.01);
    path.cubicTo(0, size.height * 0.01, 0, size.height * 0.02, 0, size.height * 0.03);
    path.cubicTo(0, size.height * 0.03, 0, size.height * 0.03, 0, size.height * 0.04);
    path.cubicTo(0, size.height * 0.05, 0, size.height * 0.06, 0, size.height * 0.07);
    path.cubicTo(0, size.height * 0.07, 0, size.height * 0.08, 0, size.height * 0.08);
    path.cubicTo(0, size.height * 0.11, 0, size.height * 0.14, 0, size.height * 0.17);
    path.cubicTo(0, size.height / 5, 0, size.height * 0.22, size.width * 0.01, size.height / 4);
    path.cubicTo(size.width * 0.01, size.height * 0.3, size.width * 0.01, size.height * 0.35, size.width * 0.01,
        size.height * 0.4);
    path.cubicTo(size.width * 0.01, size.height * 0.4, size.width * 0.02, size.height * 0.44, size.width * 0.02,
        size.height * 0.44);
    path.cubicTo(size.width * 0.02, size.height * 0.47, size.width * 0.02, size.height / 2, size.width * 0.02,
        size.height * 0.54);
    path.cubicTo(size.width * 0.01, size.height * 0.56, size.width * 0.01, size.height * 0.58, size.width * 0.01,
        size.height * 0.6);
    path.cubicTo(size.width * 0.01, size.height * 0.65, size.width * 0.01, size.height * 0.71, size.width * 0.01,
        size.height * 0.76);
    path.cubicTo(size.width * 0.01, size.height * 0.77, size.width * 0.01, size.height * 0.79, size.width * 0.01,
        size.height * 0.8);
    path.cubicTo(size.width * 0.01, size.height * 0.81, size.width * 0.01, size.height * 0.82, size.width * 0.01,
        size.height * 0.83);
    path.cubicTo(
        size.width * 0.01, size.height * 0.88, size.width * 0.01, size.height * 0.94, size.width * 0.01, size.height);
    path.cubicTo(size.width * 0.01, size.height, size.width * 0.03, size.height, size.width * 0.04, size.height);
    path.cubicTo(size.width * 0.05, size.height, size.width * 0.05, size.height, size.width * 0.06, size.height);
    path.cubicTo(size.width * 0.06, size.height, size.width * 0.06, size.height, size.width * 0.06, size.height);
    path.cubicTo(size.width * 0.06, size.height, size.width * 0.06, size.height, size.width * 0.06, size.height);
    path.cubicTo(size.width * 0.08, size.height, size.width * 0.1, size.height, size.width * 0.12, size.height);
    path.cubicTo(size.width * 0.12, size.height, size.width * 0.12, size.height, size.width * 0.12, size.height);
    path.cubicTo(size.width * 0.13, size.height, size.width * 0.13, size.height, size.width * 0.14, size.height);
    path.cubicTo(
        size.width * 0.15, size.height, size.width * 0.16, size.height * 0.98, size.width * 0.17, size.height * 0.98);
    path.cubicTo(size.width * 0.17, size.height * 0.98, size.width * 0.17, size.height * 0.98, size.width * 0.17,
        size.height * 0.98);
    path.cubicTo(size.width * 0.17, size.height * 0.98, size.width * 0.18, size.height * 0.98, size.width * 0.18,
        size.height * 0.98);
    path.cubicTo(size.width * 0.19, size.height * 0.98, size.width / 5, size.height, size.width / 5, size.height);
    path.cubicTo(size.width / 5, size.height, size.width * 0.22, size.height, size.width * 0.22, size.height);
    path.cubicTo(size.width * 0.22, size.height, size.width * 0.23, size.height, size.width * 0.23, size.height);
    path.cubicTo(
        size.width * 0.24, size.height, size.width * 0.26, size.height * 0.98, size.width * 0.27, size.height * 0.98);
    path.cubicTo(size.width * 0.32, size.height * 0.98, size.width * 0.37, size.height * 0.98, size.width * 0.42,
        size.height * 0.97);
    path.cubicTo(
        size.width * 0.43, size.height * 0.98, size.width * 0.44, size.height * 0.98, size.width * 0.46, size.height);
    path.cubicTo(size.width * 0.48, size.height * 0.98, size.width / 2, size.height * 0.98, size.width * 0.52,
        size.height * 0.97);
    path.cubicTo(size.width * 0.54, size.height * 0.97, size.width * 0.56, size.height * 0.97, size.width * 0.57,
        size.height * 0.96);
    path.cubicTo(size.width * 0.58, size.height * 0.97, size.width * 0.59, size.height * 0.97, size.width * 0.59,
        size.height * 0.97);
    path.cubicTo(size.width * 0.6, size.height * 0.97, size.width * 0.6, size.height * 0.97, size.width * 0.61,
        size.height * 0.96);
    path.cubicTo(size.width * 0.61, size.height * 0.96, size.width * 0.61, size.height * 0.96, size.width * 0.61,
        size.height * 0.96);
    path.cubicTo(size.width * 0.62, size.height * 0.96, size.width * 0.62, size.height * 0.96, size.width * 0.62,
        size.height * 0.96);
    path.cubicTo(size.width * 0.66, size.height * 0.97, size.width * 0.71, size.height * 0.97, size.width * 0.75,
        size.height * 0.97);
    path.cubicTo(size.width * 0.77, size.height * 0.96, size.width * 0.8, size.height * 0.96, size.width * 0.83,
        size.height * 0.97);
    path.cubicTo(size.width * 0.83, size.height * 0.97, size.width * 0.83, size.height * 0.97, size.width * 0.84,
        size.height * 0.97);
    path.cubicTo(size.width * 0.85, size.height * 0.97, size.width * 0.85, size.height * 0.97, size.width * 0.86,
        size.height * 0.97);
    path.cubicTo(size.width * 0.89, size.height * 0.96, size.width * 0.92, size.height * 0.96, size.width * 0.94,
        size.height * 0.96);
    path.cubicTo(size.width * 0.95, size.height * 0.97, size.width * 0.96, size.height * 0.97, size.width * 0.97,
        size.height * 0.98);
    path.cubicTo(size.width * 0.97, size.height * 0.97, size.width * 0.97, size.height * 0.97, size.width * 0.98,
        size.height * 0.96);
    path.cubicTo(
        size.width * 0.98, size.height * 0.96, size.width * 0.98, size.height * 0.96, size.width, size.height * 0.96);
    path.cubicTo(size.width, size.height * 0.96, size.width * 0.98, size.height * 0.92, size.width, size.height * 0.92);
    path.cubicTo(size.width, size.height * 0.92, size.width, size.height * 0.92, size.width, size.height * 0.92);

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
