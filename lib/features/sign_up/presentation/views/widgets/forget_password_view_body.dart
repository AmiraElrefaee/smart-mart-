import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../const.dart';
import '../../../../../core/utils/functions/app_router.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/custom_botton.dart';
import '../../../../../core/widgets/custom_side_text.dart';
import '../../../../../core/widgets/custom_title.dart';
import '../../../../login/presentation/views/widgets/custom_text_form_filed.dart';
import 'custom_form_number.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight= MediaQuery.of(context).size.height;
    double screenWidth= MediaQuery.of(context).size.width;
    return SafeArea(
          child: Padding(
      padding:  EdgeInsets.symmetric(horizontal:screenWidth*.06 ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        
            customAppBar(screenHeight: screenHeight),
        
            CustomTitle(
              sizeBox:  screenHeight*.02,
              fontTitle: .041*MediaQuery.of(context).size.height,
              fontSubTitle:.02*MediaQuery.of(context).size.height,
              title: 'Forgot Password ?',
              subTitle: 'Don t worry! It occurs. Please enter the email address linked with your account.',
            ),
            SizedBox(
              height: screenHeight*.03,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(vertical: screenHeight*.005),
              child: CustomSideText(
                text: 'Email',
              ),
            ),
            CustomTextFormFiled(
              hint: 'enter your email address',
            ),
        
        
            Padding(
              padding:  EdgeInsets.only(top: screenHeight*.05,
              bottom: screenHeight*.03
              ),
              child:  CustomBotton(
                text: 'Send code',
                colorText: Colors.white,
                background:kColor ,
                screenHeight:screenHeight ,
                screenWidth: screenWidth,
                onTap: (){
                  GoRouter.of(context).push(AppRouter.kOtpForgetPasswordPage);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Didn’t Receive the Code ?',
                  style: Styles.Urbanist25.copyWith(color: kcolor3,
                      fontSize: screenHeight*.018),),
        
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: InkWell(
                    child: Text('Resend Code',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          // decorationThickness: 2,
                          color: Colors.black,
                          fontSize: screenHeight*.021
                      ),
                    ),
                  ),
                )
        
              ],),
        
          ],),
      ),
    ));
  }
}
