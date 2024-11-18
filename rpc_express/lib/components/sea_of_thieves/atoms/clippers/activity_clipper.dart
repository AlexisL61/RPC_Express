import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class ActivityClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width * 0.97, size.height * 0.49);
    path.cubicTo(size.width * 0.97, size.height * 0.49, size.width * 0.98, size.height * 0.49, size.width * 0.98,
        size.height * 0.49);
    path.cubicTo(size.width, size.height * 0.49, size.width, size.height * 0.49, size.width, size.height * 0.48);
    path.cubicTo(size.width, size.height * 0.48, size.width, size.height * 0.47, size.width, size.height * 0.47);
    path.cubicTo(size.width, size.height * 0.44, size.width, size.height * 0.41, size.width, size.height * 0.38);
    path.cubicTo(size.width, size.height * 0.37, size.width * 0.98, size.height * 0.36, size.width, size.height * 0.35);
    path.cubicTo(size.width, size.height * 0.35, size.width, size.height * 0.35, size.width, size.height * 0.34);
    path.cubicTo(size.width, size.height * 0.34, size.width, size.height / 3, size.width, size.height * 0.32);
    path.cubicTo(size.width, size.height * 0.31, size.width, size.height * 0.3, size.width, size.height * 0.28);
    path.cubicTo(size.width, size.height * 0.27, size.width, size.height * 0.27, size.width, size.height * 0.26);
    path.cubicTo(size.width, size.height / 4, size.width, size.height * 0.24, size.width, size.height * 0.23);
    path.cubicTo(size.width, size.height * 0.22, size.width, size.height / 5, size.width, size.height / 5);
    path.cubicTo(size.width, size.height / 5, size.width, size.height * 0.19, size.width, size.height * 0.18);
    path.cubicTo(size.width, size.height * 0.16, size.width, size.height * 0.14, size.width, size.height * 0.12);
    path.cubicTo(size.width, size.height * 0.1, size.width, size.height * 0.06, size.width, size.height * 0.05);
    path.cubicTo(size.width, size.height * 0.04, size.width, size.height * 0.04, size.width, size.height * 0.03);
    path.cubicTo(size.width, size.height * 0.02, size.width, size.height * 0.02, size.width, size.height * 0.01);
    path.cubicTo(size.width, 0, size.width, 0, size.width, 0);
    path.cubicTo(size.width, 0, size.width * 0.98, 0, size.width * 0.98, 0);
    path.cubicTo(size.width * 0.97, 0, size.width * 0.97, 0, size.width * 0.96, 0);
    path.cubicTo(size.width * 0.96, 0, size.width * 0.96, size.height * 0.02, size.width * 0.95, size.height * 0.03);
    path.cubicTo(size.width * 0.95, size.height * 0.02, size.width * 0.95, size.height * 0.02, size.width * 0.95,
        size.height * 0.01);
    path.cubicTo(size.width * 0.94, size.height * 0.01, size.width * 0.94, size.height * 0.01, size.width * 0.94,
        size.height * 0.01);
    path.cubicTo(size.width * 0.92, size.height * 0.01, size.width * 0.86, size.height * 0.01, size.width * 0.84,
        size.height * 0.01);
    path.cubicTo(size.width * 0.81, size.height * 0.01, size.width * 0.77, size.height * 0.01, size.width * 0.74,
        size.height * 0.01);
    path.cubicTo(size.width * 0.7, size.height * 0.01, size.width * 0.67, size.height * 0.01, size.width * 0.63,
        size.height * 0.01);
    path.cubicTo(size.width * 0.62, size.height * 0.01, size.width * 0.61, size.height * 0.01, size.width * 0.61,
        size.height * 0.01);
    path.cubicTo(size.width * 0.6, size.height * 0.01, size.width * 0.59, 0, size.width * 0.59, size.height * 0.01);
    path.cubicTo(size.width * 0.59, size.height * 0.01, size.width * 0.59, size.height * 0.02, size.width * 0.58,
        size.height * 0.03);
    path.cubicTo(size.width * 0.58, size.height * 0.03, size.width * 0.57, size.height * 0.03, size.width * 0.57,
        size.height * 0.03);
    path.cubicTo(size.width * 0.56, size.height * 0.03, size.width * 0.57, size.height * 0.01, size.width * 0.56,
        size.height * 0.01);
    path.cubicTo(size.width * 0.56, size.height * 0.01, size.width * 0.55, size.height * 0.01, size.width * 0.55,
        size.height * 0.01);
    path.cubicTo(size.width * 0.54, size.height * 0.01, size.width * 0.54, size.height * 0.01, size.width * 0.53,
        size.height * 0.01);
    path.cubicTo(size.width * 0.52, size.height * 0.01, size.width * 0.52, size.height * 0.01, size.width * 0.51,
        size.height * 0.02);
    path.cubicTo(size.width * 0.51, size.height * 0.03, size.width * 0.51, size.height * 0.03, size.width / 2,
        size.height * 0.04);
    path.cubicTo(
        size.width / 2, size.height * 0.03, size.width / 2, size.height * 0.03, size.width / 2, size.height * 0.02);
    path.cubicTo(size.width * 0.49, size.height * 0.01, size.width * 0.49, size.height * 0.01, size.width * 0.49,
        size.height * 0.01);
    path.cubicTo(size.width * 0.47, size.height * 0.01, size.width * 0.45, size.height * 0.01, size.width * 0.44,
        size.height * 0.01);
    path.cubicTo(size.width * 0.4, size.height * 0.02, size.width * 0.37, size.height * 0.01, size.width / 3,
        size.height * 0.01);
    path.cubicTo(size.width * 0.32, size.height * 0.01, size.width * 0.3, size.height * 0.01, size.width * 0.29,
        size.height * 0.01);
    path.cubicTo(size.width * 0.27, size.height * 0.01, size.width / 4, size.height * 0.01, size.width * 0.24,
        size.height * 0.01);
    path.cubicTo(size.width * 0.23, size.height * 0.01, size.width * 0.23, size.height * 0.01, size.width * 0.22,
        size.height * 0.01);
    path.cubicTo(
        size.width * 0.22, size.height * 0.01, size.width / 5, size.height * 0.01, size.width / 5, size.height * 0.01);
    path.cubicTo(
        size.width / 5, size.height * 0.01, size.width / 5, size.height * 0.01, size.width / 5, size.height * 0.01);
    path.cubicTo(size.width * 0.19, size.height * 0.01, size.width * 0.19, size.height * 0.02, size.width * 0.18,
        size.height * 0.02);
    path.cubicTo(size.width * 0.18, size.height * 0.02, size.width * 0.17, size.height * 0.01, size.width * 0.17,
        size.height * 0.01);
    path.cubicTo(size.width * 0.16, 0, size.width * 0.14, 0, size.width * 0.12, 0);
    path.cubicTo(size.width * 0.11, 0, size.width * 0.09, 0, size.width * 0.07, 0);
    path.cubicTo(size.width * 0.06, 0, size.width * 0.02, 0, size.width * 0.02, 0);
    path.cubicTo(size.width * 0.01, 0, 0, 0, 0, 0);
    path.cubicTo(0, 0, 0, size.height * 0.01, 0, size.height * 0.02);
    path.cubicTo(0, size.height * 0.03, 0, size.height * 0.05, 0, size.height * 0.06);
    path.cubicTo(0, size.height * 0.08, 0, size.height * 0.14, 0, size.height * 0.16);
    path.cubicTo(0, size.height / 5, 0, size.height * 0.26, 0, size.height * 0.3);
    path.cubicTo(0, size.height * 0.31, 0, size.height * 0.32, 0, size.height / 3);
    path.cubicTo(size.width * 0.01, size.height * 0.34, size.width * 0.01, size.height * 0.35, size.width * 0.01,
        size.height * 0.36);
    path.cubicTo(size.width * 0.01, size.height * 0.37, size.width * 0.01, size.height * 0.37, size.width * 0.01,
        size.height * 0.38);
    path.cubicTo(size.width * 0.01, size.height * 0.39, size.width * 0.01, size.height * 0.39, size.width * 0.01,
        size.height * 0.4);
    path.cubicTo(size.width * 0.01, size.height * 0.4, size.width * 0.01, size.height * 0.4, 0, size.height * 0.4);
    path.cubicTo(0, size.height * 0.4, 0, size.height * 0.4, 0, size.height * 0.4);
    path.cubicTo(0, size.height * 0.41, 0, size.height * 0.42, 0, size.height * 0.42);
    path.cubicTo(0, size.height * 0.43, 0, size.height * 0.44, 0, size.height * 0.45);
    path.cubicTo(0, size.height * 0.46, 0, size.height * 0.46, size.width * 0.01, size.height * 0.47);
    path.cubicTo(size.width * 0.01, size.height * 0.48, size.width * 0.01, size.height * 0.48, size.width * 0.02,
        size.height * 0.49);
    path.cubicTo(size.width * 0.02, size.height * 0.49, size.width * 0.02, size.height * 0.49, size.width * 0.02,
        size.height / 2);
    path.cubicTo(
        size.width * 0.02, size.height / 2, size.width * 0.01, size.height / 2, size.width * 0.01, size.height / 2);
    path.cubicTo(0, size.height * 0.51, 0, size.height / 2, 0, size.height * 0.51);
    path.cubicTo(0, size.height * 0.52, 0, size.height * 0.54, 0, size.height * 0.55);
    path.cubicTo(0, size.height * 0.59, 0, size.height * 0.64, 0, size.height * 0.68);
    path.cubicTo(0, size.height * 0.69, 0, size.height * 0.7, 0, size.height * 0.71);
    path.cubicTo(0, size.height * 0.73, 0, size.height * 0.73, size.width * 0.01, size.height * 0.73);
    path.cubicTo(size.width * 0.01, size.height * 0.73, size.width * 0.01, size.height * 0.74, size.width * 0.01,
        size.height * 0.75);
    path.cubicTo(size.width * 0.01, size.height * 0.75, size.width * 0.01, size.height * 0.76, size.width * 0.01,
        size.height * 0.76);
    path.cubicTo(0, size.height * 0.77, 0, size.height * 0.8, 0, size.height * 0.81);
    path.cubicTo(0, size.height * 0.84, 0, size.height * 0.91, 0, size.height * 0.93);
    path.cubicTo(0, size.height * 0.94, 0, size.height * 0.95, 0, size.height * 0.96);
    path.cubicTo(0, size.height * 0.97, 0, size.height * 0.98, 0, size.height);
    path.cubicTo(0, size.height, 0, size.height, size.width * 0.01, size.height);
    path.cubicTo(size.width * 0.02, size.height, size.width * 0.04, size.height, size.width * 0.06, size.height);
    path.cubicTo(size.width * 0.08, size.height, size.width * 0.1, size.height, size.width * 0.12, size.height);
    path.cubicTo(size.width * 0.13, size.height, size.width * 0.14, size.height, size.width * 0.15, size.height);
    path.cubicTo(size.width * 0.15, size.height, size.width * 0.16, size.height, size.width * 0.17, size.height);
    path.cubicTo(
        size.width * 0.17, size.height, size.width * 0.18, size.height * 0.98, size.width * 0.19, size.height * 0.98);
    path.cubicTo(
        size.width * 0.19, size.height * 0.97, size.width / 5, size.height * 0.98, size.width / 5, size.height * 0.98);
    path.cubicTo(size.width / 5, size.height, size.width / 5, size.height, size.width * 0.22, size.height);
    path.cubicTo(size.width * 0.23, size.height, size.width * 0.24, size.height, size.width / 4, size.height);
    path.cubicTo(size.width * 0.27, size.height, size.width * 0.29, size.height, size.width * 0.3, size.height);
    path.cubicTo(size.width * 0.34, size.height, size.width * 0.38, size.height, size.width * 0.42, size.height);
    path.cubicTo(size.width * 0.44, size.height, size.width * 0.46, size.height, size.width * 0.48, size.height);
    path.cubicTo(size.width * 0.48, size.height, size.width * 0.49, size.height, size.width * 0.49, size.height);
    path.cubicTo(size.width / 2, size.height, size.width * 0.49, size.height, size.width / 2, size.height);
    path.cubicTo(
        size.width / 2, size.height * 0.98, size.width / 2, size.height * 0.97, size.width / 2, size.height * 0.97);
    path.cubicTo(size.width * 0.51, size.height * 0.97, size.width * 0.51, size.height * 0.98, size.width * 0.51,
        size.height * 0.98);
    path.cubicTo(size.width * 0.52, size.height, size.width * 0.52, size.height, size.width * 0.52, size.height);
    path.cubicTo(size.width * 0.53, size.height * 0.98, size.width * 0.53, size.height * 0.98, size.width * 0.54,
        size.height * 0.98);
    path.cubicTo(size.width * 0.54, size.height, size.width * 0.55, size.height, size.width * 0.55, size.height);
    path.cubicTo(size.width * 0.56, size.height, size.width * 0.56, size.height, size.width * 0.57, size.height);
    path.cubicTo(size.width * 0.57, size.height, size.width * 0.57, size.height, size.width * 0.58, size.height);
    path.cubicTo(size.width * 0.59, size.height, size.width * 0.6, size.height, size.width * 0.61, size.height);
    path.cubicTo(size.width * 0.62, size.height, size.width * 0.64, size.height, size.width * 0.66, size.height);
    path.cubicTo(size.width * 0.67, size.height, size.width * 0.69, size.height, size.width * 0.71, size.height);
    path.cubicTo(size.width * 0.72, size.height, size.width * 0.74, size.height, size.width * 0.76, size.height);
    path.cubicTo(size.width * 0.76, size.height, size.width * 0.77, size.height, size.width * 0.78, size.height);
    path.cubicTo(size.width * 0.78, size.height * 0.98, size.width * 0.79, size.height * 0.98, size.width * 0.79,
        size.height * 0.98);
    path.cubicTo(size.width * 0.8, size.height * 0.98, size.width * 0.81, size.height * 0.98, size.width * 0.82,
        size.height * 0.98);
    path.cubicTo(size.width * 0.83, size.height * 0.98, size.width * 0.83, size.height * 0.98, size.width * 0.83,
        size.height * 0.98);
    path.cubicTo(size.width * 0.84, size.height * 0.98, size.width * 0.84, size.height * 0.98, size.width * 0.85,
        size.height * 0.98);
    path.cubicTo(size.width * 0.85, size.height, size.width * 0.85, size.height, size.width * 0.86, size.height);
    path.cubicTo(size.width * 0.86, size.height, size.width * 0.87, size.height, size.width * 0.88, size.height);
    path.cubicTo(size.width * 0.9, size.height, size.width * 0.95, size.height, size.width * 0.96, size.height);
    path.cubicTo(size.width * 0.97, size.height, size.width * 0.98, size.height, size.width, size.height);
    path.cubicTo(size.width, size.height, size.width, size.height, size.width, size.height);
    path.cubicTo(size.width, size.height, size.width, size.height * 0.98, size.width, size.height * 0.97);
    path.cubicTo(size.width, size.height * 0.96, size.width, size.height * 0.94, size.width, size.height * 0.93);
    path.cubicTo(size.width, size.height * 0.91, size.width, size.height * 0.84, size.width, size.height * 0.82);
    path.cubicTo(size.width, size.height * 0.77, size.width, size.height * 0.73, size.width, size.height * 0.68);
    path.cubicTo(size.width, size.height * 0.67, size.width, size.height * 0.65, size.width, size.height * 0.64);
    path.cubicTo(size.width, size.height * 0.63, size.width, size.height * 0.62, size.width, size.height * 0.61);
    path.cubicTo(
        size.width, size.height * 0.61, size.width * 0.98, size.height * 0.61, size.width * 0.98, size.height * 0.6);
    path.cubicTo(size.width * 0.98, size.height * 0.59, size.width, size.height * 0.58, size.width, size.height * 0.57);
    path.cubicTo(size.width, size.height * 0.57, size.width, size.height * 0.56, size.width, size.height * 0.55);
    path.cubicTo(size.width, size.height * 0.54, size.width, size.height * 0.52, size.width, size.height * 0.51);
    path.cubicTo(size.width, size.height / 2, size.width, size.height / 2, size.width * 0.98, size.height / 2);
    path.cubicTo(
        size.width * 0.98, size.height / 2, size.width * 0.97, size.height / 2, size.width * 0.97, size.height * 0.49);
    path.cubicTo(size.width * 0.97, size.height * 0.49, size.width * 0.97, size.height * 0.49, size.width * 0.97,
        size.height * 0.49);
    path.cubicTo(size.width * 0.97, size.height * 0.49, size.width * 0.97, size.height * 0.49, size.width * 0.97,
        size.height * 0.49);

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
