import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../const.dart';
import '../../../../../utils/styles.dart';

class CustomBotton extends StatelessWidget {
  const CustomBotton({super.key,

    required this.text,
    required this.background,
    required this.colorText, required this.screenHeight, required this.screenWidth});
  final double screenHeight;
  final double screenWidth;
final String text;
final Color background;
final Color colorText;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height * .06,

          decoration: BoxDecoration(
              color: background,
              borderRadius: BorderRadius.circular(10)
          ),
          child: Text(text, style:
          Styles.NexaBold24.copyWith(color: colorText,
          fontSize: MediaQuery.of(context).size.width*.05
          ),)),
    );
  }
}
