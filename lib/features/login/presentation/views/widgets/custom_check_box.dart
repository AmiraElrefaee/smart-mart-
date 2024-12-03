import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_mart/const.dart';
import 'package:smart_mart/core/utils/functions/app_router.dart';

import '../../../../../core/widgets/custom_side_text.dart';
import '../../../../../core/widgets/custom_text_botton.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox ({super.key, required this.screenHeight, required this.screenWidth});
  final double screenHeight;
  final double screenWidth;
  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool isChecked=false;
  @override
  Widget build(BuildContext context) {
    return  Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Transform.scale(
      scale: MediaQuery.of(context).size.width*.0025,
      child: Checkbox(

        side: BorderSide(
          color: isChecked ? kColor : kcolor3, // Change border color
          width: 2, // Border width
        ),
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return kColor; // Background when selected
          }
          return Color(0xffF7F7F7); // Background when unselected
        }),
        shape: RoundedRectangleBorder( // Custom shape
          borderRadius: BorderRadius.circular(5),
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

      CustomTextBottom( text: 'Forgot password ?',
      onTap: (){
        GoRouter.of(context).push(AppRouter.kForgetPasswordPage);
      },
      )

    ],);
  }
}

