import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_mart/const.dart';
import 'package:smart_mart/features/login/presentation/views/widgets/section_bottons.dart';
import 'package:smart_mart/features/login/presentation/views/widgets/section_google_botton.dart';
import 'package:smart_mart/features/login/presentation/views/widgets/separate_line_section.dart';

import '../../../../on_boarding/presentation/views/widgets/custom_background_images.dart';
import 'custom_background.dart';
import 'custom_botton.dart';
import 'custom_check_box.dart';
import 'custom_form.dart';
import 'custom_side_text.dart';
import 'custom_text_botton.dart';
import 'custom_title.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: Stack(children: [
          CustomBackground(),
          Positioned
            (
              width: screenWidth,
              top: screenHeight* .34,
              child: Padding(
                padding:  EdgeInsets.only(
                  right: MediaQuery.of(context).size.width*.05
                  ,left: MediaQuery.of(context).size.width*.05,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                  CustomTitle(
                    screenHeight: screenHeight,
                    screenWidth: screenWidth,
                  ),
                    SizedBox(
                      height: screenHeight*.025,
                    ),
                    CustomForm(
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                    ),
                    CustomCheckBox(
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                    ),

                    SizedBox(
                      height:screenHeight*.02,
                    ),

                    CustomBotton(
                      screenHeight: screenHeight*.7,
                      screenWidth: screenWidth,
                      background: kColor,
                      colorText: Colors.white,
                      text: 'Log in ',
                    ),
                    SizedBox(
                      height: screenHeight*.025,
                    ),
                    SeparateLineSection(
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                    ),
                    SizedBox(
                      height: screenHeight*.025,
                    ),
                    SectionGoogleBotton(
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                    ),
                    SizedBox(
                      height: screenHeight*.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomSideText(text: 'Already have an account ?',),

                        CustomTextBottom(
                          text: 'Sign up',
                        ),
                      ],),


                          ],),
              )),
        ],),
      ),
    );
  }
}
