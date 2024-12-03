import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_mart/const.dart';

import '../../../../../core/utils/styles.dart';

class SeparateLineSection extends StatelessWidget {
  const SeparateLineSection({super.key, required this.screenHeight, required this.screenWidth});
  final double screenHeight;
  final double screenWidth;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Container(
        alignment: Alignment.center,
        padding:  EdgeInsets.only(

            right: MediaQuery.of(context).size.width * .03
        ),
        color: ksecodaryColor,
       width: MediaQuery.of(context).size.width *.25 ,
        height: 1,
      ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Text('or continue with',
          style: Styles.Urbanist16.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: MediaQuery.of(context).size.height*.018,
          ),
          ),
        ),

        Container(
          alignment: Alignment.center,
          padding:  EdgeInsets.only(
              left :MediaQuery.of(context).size.width * .03,

          ),
          color:ksecodaryColor,
          width: MediaQuery.of(context).size.width *.25 ,
          height: 1,
        ),

    ],);
  }
}
