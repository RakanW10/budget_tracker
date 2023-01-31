import 'package:flutter/material.dart';

class MainCanava extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.5811954, size.height * 0.7705022);
    path_0.cubicTo(
        size.width * 0.7937147,
        size.height * 0.4139130,
        size.width * 0.9532314,
        size.height * 0.7459087,
        size.width * 1.005141,
        size.height);
    path_0.lineTo(size.width * 1.007712, size.height * -1.195652);
    path_0.lineTo(size.width * 0.002571311, size.height * -1.195652);
    path_0.lineTo(0, size.height * -0.09376587);
    path_0.cubicTo(
        size.width * 0.08091594,
        size.height * 0.8170848,
        size.width * 0.3155476,
        size.height * 1.216239,
        size.width * 0.5811954,
        size.height * 0.7705022);
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
