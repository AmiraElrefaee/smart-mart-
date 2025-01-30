import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_mart/const.dart';
import 'package:smart_mart/features/login/presentation/views/widgets/section_bottons.dart';
import 'package:smart_mart/features/login/presentation/views/widgets/section_google_botton.dart';
import 'package:smart_mart/features/login/presentation/views/widgets/custom_question_botton.dart';
import 'package:smart_mart/features/login/presentation/views/widgets/separate_line_section.dart';

import '../../../../../core/utils/functions/Navigate_to_page.dart';
import '../../../../../core/utils/functions/app_router.dart';
import '../../../../on_boarding/presentation/views/widgets/custom_background_images.dart';
import 'custom_background.dart';
import '../../../../../core/widgets/custom_botton.dart';
import 'custom_check_box.dart';
import 'custom_form.dart';
import '../../../../../core/widgets/custom_side_text.dart';
import '../../../../../core/widgets/custom_text_botton.dart';
import '../../../../../core/widgets/custom_title.dart';

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
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
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
                       sizeBox: 0,
                       fontTitle: .041*MediaQuery.of(context).size.height,
                       fontSubTitle:.02*MediaQuery.of(context).size.height,
                       title: 'Welcome Back',
                       subTitle: 'Let’s get started and go shopping',

                     ),

                       SizedBox(
                         height: screenHeight*.025,
                       ),

                       CustomForm(
                         screenHeight:screenHeight,
                         screenWidth:  screenWidth,
                       ),
                       SizedBox(
                         height: screenHeight*.02,
                       ),

                       CustomQuesBotton(
                         mainQest: 'Already have an account ?',
                         bottonText:'Sign up' ,
                         onTap:()=>navigateToPage(
                             AppRouter.kSignUpPage, context)
                       ),


                             ],),
                 )),
           ]),
          ),
        ),
    );

  }
}

