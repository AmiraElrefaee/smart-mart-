import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../../../../const.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/custom_botton.dart';
import '../../../../../core/widgets/custom_title.dart';
import 'custom_text_form_OTP.dart';

class OtpForgetPasswordViewBody extends StatelessWidget {
  const OtpForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight= MediaQuery.of(context).size.height;
    double screenWidth= MediaQuery.of(context).size.width;
    final defaultPinTheme = PinTheme(

      width: screenWidth*.19,
      height: screenWidth*.16,
      textStyle: const TextStyle(

        fontSize: 22,
        color: Color(0xff989797),
      ),
      decoration: BoxDecoration(

        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            color: Color(0xff989797),
            width: 1
        ),

      ),
    );

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal:screenWidth*.06 ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            customAppBar(
              screenHeight: screenHeight,),

            CustomTitle(
              sizeBox:  screenHeight*.02,
              fontTitle: .04*MediaQuery.of(context).size.height,
              fontSubTitle:.02*MediaQuery.of(context).size.height,

              title: 'OTP Verification',
              subTitle: 'Enter the verification code we just sent on your email address.'
                  '',
            ),

            CustomTextFormOTP(screenHeight: screenHeight,
                screenWidth: screenWidth,
                defaultPinTheme: defaultPinTheme),



            Padding(
              padding:  EdgeInsets.only(bottom :screenHeight*.03,


              ),
              child: CustomBotton(
                text: 'Send code',
                background: kColor,
                colorText: Colors.white,
                screenHeight: screenHeight,
                screenWidth: screenWidth,
                onTap: (){},
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
    );
  }
}
