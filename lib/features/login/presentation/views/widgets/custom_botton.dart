import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../const.dart';
import '../../../../../utils/styles.dart';

class CustomBotton extends StatelessWidget {
  const CustomBotton({super.key,

    required this.text,
    required this.background,
    required this.colorText,
    required this.screenHeight,
    required this.screenWidth,
   required this.onTap});
  final double screenHeight;
  final double screenWidth;
final String text;
final Color background;
final Color colorText;
final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height * .055,

          decoration: BoxDecoration(
              color: background,
              borderRadius: BorderRadius.circular(10)
          ),
          child: Text(text, style:
          Styles.Urbanist20.copyWith(color: colorText,
          fontSize:MediaQuery.of(context).size.height*.023,
          ),)),
    );
  }
}
