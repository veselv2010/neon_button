import 'package:flutter/material.dart';

const double _kRadius = 16;
const double _kBorderWidth = 8;

class MyPainter extends CustomPainter {
  final Color borderColor;
  MyPainter(this.borderColor);

  @override
  void paint(Canvas canvas, Size size) {
    final rrectBorder =
        RRect.fromRectAndRadius(Offset.zero & size, Radius.circular(_kRadius));
    final rrectShadow =
        RRect.fromRectAndRadius(Offset.zero & size, Radius.circular(_kRadius));

    final shadowPaint = Paint()
      ..strokeWidth = _kBorderWidth
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..maskFilter = MaskFilter.blur(BlurStyle.outer, 14);

    final borderPaint = Paint()
      ..strokeWidth = _kBorderWidth
      ..color = borderColor
      ..style = PaintingStyle.stroke;

    canvas.drawRRect(rrectShadow, shadowPaint);
    canvas.drawRRect(rrectBorder, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
