import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_mart/const.dart';

import 'Explanatory_text.dart';

class SlidingText extends StatelessWidget {
  SlidingText({
    super.key,
    required this.slideAnimations,
    required this.fadeAnimations
  });

  final List<Animation<Offset>> slideAnimations;
  final List<Animation<double>> fadeAnimations;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Left word
        FadeTransition(
          opacity: fadeAnimations[2],
          child: SlideTransition(
            position: slideAnimations[2],
            child: ExplantoryText(
              text1: 'S', text2: 'can ,',),
          ),
        ),
        const SizedBox(width: 8),
        // Middle word
        FadeTransition(
          opacity: fadeAnimations[0],
          child: SlideTransition(
            position: slideAnimations[0],
            child: ExplantoryText(
              text1: 'p', text2: 'ay ,',),
          ),
        ),
        const SizedBox(width: 8),
        // Right word
        FadeTransition(
          opacity: fadeAnimations[1],
          child: SlideTransition(
            position: slideAnimations[1],
            child: ExplantoryText(
              text1: 'G', text2: 'o.',),
          ),
        ),
      ],
    );}}

