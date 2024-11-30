import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../const.dart';
import '../../../../../utils/styles.dart';

class CustomBotton extends StatelessWidget {
  const CustomBotton({super.key,
    required this.top,
    required this.text,
    required this.background,
    required this.colorText});
final double top;
final String text;
final Color background;
final Color colorText;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      width: MediaQuery.of(context).size.width,
      top: MediaQuery.of(context).size.height * top,
      child: InkWell(
        onTap: (){},
        child: Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height * .06,
            margin: EdgeInsets.all(MediaQuery.of(context).size.height * .03),
            decoration: BoxDecoration(
                color: background,
                borderRadius: BorderRadius.circular(10)
            ),
            child: Text(text, style:
            Styles.NexaBold24.copyWith(color: colorText,
            fontSize: MediaQuery.of(context).size.width*.055
            ),)),
      ),
    );
  }
}
