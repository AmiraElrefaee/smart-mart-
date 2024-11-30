import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_mart/const.dart';

import 'custom_side_text.dart';
import 'custom_text_botton.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox ({super.key});

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool isChecked=false;
  @override
  Widget build(BuildContext context) {
    return  Positioned(
    width: MediaQuery.of(context).size.width,
  top: MediaQuery.of(context).size.height * .65,
  child: Padding(
  padding:  EdgeInsets.only(
  right: MediaQuery.of(context).size.width*.05
  ,left: MediaQuery.of(context).size.width*.05,
      top:  MediaQuery.of(context).size.height*.01,
    bottom:  MediaQuery.of(context).size.height*.09
  ),
  child: Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
  Transform.scale(
    scale: 1.2,
    child: Checkbox(

      focusColor: kColor,
      activeColor: kColor,
      hoverColor: kColor,

      shape: RoundedRectangleBorder( // Custom shape
        borderRadius: BorderRadius.circular(3),
      ),
      visualDensity: VisualDensity(horizontal: -4.0, vertical: -4.0),
    value: isChecked, // Current state of the checkbox
     onChanged: (value) {
       setState(() {
         isChecked = !isChecked;// Update the state
         value=isChecked;
      });
     },
    ),
  ),

  CustomSideText(
    text: 'keep me signed in',
  ),

  Padding(
    padding:  EdgeInsets.only(left:MediaQuery.of(context).size.width*.01 ),
    child: SvgPicture.asset('assets/images/Vector (2).svg',
    height: MediaQuery.of(context).size.height * .018,
    ),
  ),

  Spacer(),

    CustomTextBottom( text: 'Forgot password ?',)

  ],),
  ),
  );
  }
}

