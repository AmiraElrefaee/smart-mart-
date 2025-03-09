import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'conrner_border_painter.dart';

class SaquareCamera extends StatelessWidget {
  const SaquareCamera({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: MediaQuery.of(context).size.height*.5,
      child: Container(
        width: 220,
        height: 220,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white.withOpacity(.44),
        ),
        child: CustomPaint(
          painter: CornerBorderPainter(cornerRadius: 30.0), // Set your desired radius
        ),
      ),
    );
  }
}