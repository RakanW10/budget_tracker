import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:get/get.dart';

var WIDTH = Get.width;

class homepageBackgrund extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.5745769, size.height * 0.9552662);
    path_0.cubicTo(
        size.width * 0.7865513,
        size.height * 0.8857626,
        size.width * 0.9456590,
        size.height * 0.9504748,
        size.width * 0.9974359,
        size.height);
    path_0.lineTo(size.width, 0);
    path_0.lineTo(size.width * -0.002563477, 0);
    path_0.lineTo(size.width * -0.005128205, size.height * 0.7868082);
    path_0.cubicTo(
        size.width * 0.07558026,
        size.height * 0.9643477,
        size.width * 0.3096103,
        size.height * 1.042149,
        size.width * 0.5745769,
        size.height * 0.9552662);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xff212324).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
