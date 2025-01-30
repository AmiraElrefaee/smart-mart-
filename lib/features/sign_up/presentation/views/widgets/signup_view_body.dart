import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_mart/const.dart';
import '../../../../../core/utils/functions/Navigate_to_page.dart';
import '../../../../../core/utils/functions/app_router.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_botton.dart';
import '../../../../login/presentation/views/widgets/custom_question_botton.dart';
import '../../../../../core/widgets/custom_title.dart';
import '../../../../login/presentation/views/widgets/section_google_botton.dart';
import 'custon_form_signUp.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  @override
  Widget build(BuildContext context) {
     double screenHeight= MediaQuery.of(context).size.height;
     double screenWidth= MediaQuery.of(context).size.width;
    return SafeArea(child: GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: screenWidth*.09),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding:  EdgeInsets.only(top: screenHeight*.02),
                  child: CustomTitle(
                    sizeBox: 0,
                    fontTitle: .075*MediaQuery.of(context).size.width,
                    fontSubTitle:.039*MediaQuery.of(context).size.width,
                    title: 'Create account',
                    subTitle: 'Start exploring smarter shopping ',
                  ),
                ),
              ),
              SizedBox(
                height:screenHeight*.03 ,
              ),
              CustonFormSignup(
                screenWidth: screenWidth,
                screenHeight:screenHeight ,
              ),

              CustomBotton(
                text: 'Continue',
                background: kColor,
                colorText: Colors.white,
                screenWidth: screenWidth,
                screenHeight:screenHeight ,
                onTap:()=>navigateToPage(AppRouter.kAddPhoneNumPage,context)
              ),

              Padding(
                padding:  EdgeInsets.symmetric(vertical: screenHeight*.019),
                child: Text('Other sign up options',
                  style: Styles.Urbanist16.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Colors.black.withOpacity(0.7),
                    fontSize: MediaQuery.of(context).size.height*.018,
                  ),
                ),
              ),
              SectionGoogleBotton(
                screenHeight: screenHeight,
                screenWidth: screenWidth,
              ),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: screenHeight*.02),
                child: CustomQuesBotton(
                  mainQest: 'Already have an account ?',
                  bottonText: 'Log in',
                  onTap: (){
                    GoRouter.of(context).pop();
                  },
                ),
              ),

          ],),
        ),
      ),
    ));
  }
}
