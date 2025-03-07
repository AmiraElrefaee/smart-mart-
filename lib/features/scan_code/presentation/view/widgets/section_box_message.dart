import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'fail_massege.dart';
import 'main_massega.dart';

class SectionBoxMassege extends StatelessWidget {
  const SectionBoxMassege({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.scanResult,
  });

  final double screenHeight;
  final double screenWidth;
  final String? scanResult;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: screenHeight * .15,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 30),
        width: screenWidth * .85,
        height: screenHeight * .2,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: scanResult != null
            ? MainMassege(screenWidth: screenWidth)
            : FailMassege(screenWidth: screenWidth),
      ),
    );
  }
}