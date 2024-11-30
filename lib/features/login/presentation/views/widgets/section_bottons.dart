import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_mart/features/login/presentation/views/widgets/section_google_botton.dart';
import 'package:smart_mart/features/login/presentation/views/widgets/separate_line_section.dart';

import '../../../../../const.dart';
import 'custom_botton.dart';
import 'custom_check_box.dart';
import 'custom_side_text.dart';
import 'custom_text_botton.dart';

class SectionBottons extends StatelessWidget {
  const SectionBottons({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height*.67,
      width: MediaQuery.of(context).size.width ,
      child: Column(
        children: [
        CustomCheckBox(),
        CustomBotton(
          top: .675,
          background: kColor,
          colorText: Colors.white,
          text: 'Log in ',
        ),
        SeparateLineSection(),
        SectionGoogleBotton(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomSideText(text: 'Already have an account ?',),

            CustomTextBottom(
              text: 'Sign up',
            ),
          ],
        ),

      ],),
    );
  }
}
