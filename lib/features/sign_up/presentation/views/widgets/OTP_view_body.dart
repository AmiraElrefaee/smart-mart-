import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:smart_mart/const.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/custom_botton.dart';
import '../../../../../core/widgets/custom_title.dart';
import 'custom_text_form_OTP.dart';

class OtpViewBody extends StatelessWidget {
  const OtpViewBody({super.key});

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
        padding: EdgeInsets.symmetric(horizontal:screenWidth*.09),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
            customAppBar(
              screenHeight: screenHeight,
            ),
            Center(
              child: CustomTitle(
                sizeBox:  screenHeight*.02,
                fontTitle: .075*MediaQuery.of(context).size.width,
                fontSubTitle:.039*MediaQuery.of(context).size.width,

                title: 'Confirm your number',
                subTitle: 'Enter the code we sent to +20 0122 ******30',
              ),
            ),

              CustomTextFormOTP(screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  defaultPinTheme: defaultPinTheme),

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


              Spacer(),

              Padding(
                padding:  EdgeInsets.only(bottom: screenHeight*.08,


                ),
                child: CustomBotton(
                  text: 'Verify now',
                  background: kColor,
                  colorText: Colors.white,
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  onTap: (){},
                ),
              )

          ],),
        ),
      ),
    );
  }
}


