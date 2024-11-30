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
    return SingleChildScrollView(
      child: SizedBox(
        height: screenHeight,
        child: Stack(children: [
          CustomBackground(),
          CustomTitle(),

          CustomForm(),
          CustomCheckBox(),
          // SectionBottons(),
          CustomBotton(
            top: .684,
            background: kColor,
            colorText: Colors.white,
            text: 'Log in ',
          ),
          SeparateLineSection(),
          SectionGoogleBotton(),

          Positioned(
              top: MediaQuery.of(context).size.height*.93,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomSideText(text: 'Already have an account ?',),

                  CustomTextBottom(
                    text: 'Sign up',
                  ),
                ],
              ))
        ],),
      ),
    );
  }
}
