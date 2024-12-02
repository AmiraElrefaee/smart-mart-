import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_mart/const.dart';
import 'package:smart_mart/utils/functions/app_router.dart';

import '../../../../../utils/styles.dart';
import '../../../../login/presentation/views/widgets/custom_botton.dart';
import '../../../../login/presentation/views/widgets/custom_question_botton.dart';
import '../../../../login/presentation/views/widgets/custom_title.dart';
import 'custon_form_signUp.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
     double screenHeight= MediaQuery.of(context).size.height;
     double screenWidth= MediaQuery.of(context).size.width;
    return SafeArea(child: Padding(
      padding:  EdgeInsets.symmetric(horizontal: screenWidth*.06),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding:  EdgeInsets.only(top: screenHeight*.03),
                child: CustomTitle(
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
              onTap: (){
                // GoRouter.of(context).push(AppRouter.kloginPage);

                GoRouter.of(context).push(AppRouter.kAddPhoneNumPage);
              },
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

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              IconButton(onPressed: (){},
                  icon: SvgPicture.asset('assets/images/Button with centered icon.svg',
                    height: screenHeight*.06,
        
                  )),
        
              IconButton(onPressed: (){

              },
                  icon: SvgPicture.asset('assets/images/Button with centered icon (1).svg',
                    height: screenHeight*.06,
                  )),
        
            ],),
        
            CustomQuesBotton(
              mainQest: 'Already have an account ?',
              bottonText: 'Log in',
              onTap: (){
                GoRouter.of(context).pop();
              },
            ),
        
        ],),
      ),
    ));
  }
}
