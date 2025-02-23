import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CornerBorderPainter extends CustomPainter {
  final double cornerRadius; // نصف قطر الزوايا
  final double edgeLength; // طول الحواف

  CornerBorderPainter({this.cornerRadius = 20.0, this.edgeLength = 80.0}); // قيم افتراضية

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke;

    // إنشاء مسار مع حواف أطول وزوايا مدورة
    Path path = Path();

    // الزاوية العلوية اليسرى
    path.moveTo(0, edgeLength); // بداية الحافة العلوية اليسرى
    path.lineTo(0, cornerRadius); // الانتقال إلى بداية القوس
    path.arcToPoint(
      Offset(cornerRadius, 0),
      radius: Radius.circular(cornerRadius),
    );
    path.lineTo(edgeLength, 0); // نهاية الحافة العلوية اليسرى

    // الزاوية العلوية اليمنى
    path.moveTo(size.width - edgeLength, 0); // بداية الحافة العلوية اليمنى
    path.lineTo(size.width - cornerRadius, 0); // الانتقال إلى بداية القوس
    path.arcToPoint(
      Offset(size.width, cornerRadius),
      radius: Radius.circular(cornerRadius),
    );
    path.lineTo(size.width, edgeLength); // نهاية الحافة العلوية اليمنى

    // الزاوية السفلية اليمنى
    path.moveTo(size.width, size.height - edgeLength); // بداية الحافة السفلية اليمنى
    path.lineTo(size.width, size.height - cornerRadius); // الانتقال إلى بداية القوس
    path.arcToPoint(
      Offset(size.width - cornerRadius, size.height),
      radius: Radius.circular(cornerRadius),
    );
    path.lineTo(size.width - edgeLength, size.height); // نهاية الحافة السفلية اليمنى

    // الزاوية السفلية اليسرى
    path.moveTo(edgeLength, size.height); // بداية الحافة السفلية اليسرى
    path.lineTo(cornerRadius, size.height); // الانتقال إلى بداية القوس
    path.arcToPoint(
      Offset(0, size.height - cornerRadius),
      radius: Radius.circular(cornerRadius),
    );
    path.lineTo(0, size.height - edgeLength); // نهاية الحافة السفلية اليسرى

    // رسم المسار
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}