import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:smart_mart/core/utils/functions/app_router.dart';

import '../../../../../const.dart';
import '../../../../../core/utils/functions/Navigate_to_page.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/custom_botton.dart';
import '../../../../../core/widgets/custom_title.dart';
import '../../managers/OTP_sign_up_cubit/otp_sign_up_cubit.dart';
import '../../managers/forget_password_cubit/foget_password_cubit.dart';
import 'custom_text_form_OTP.dart';

class OtpForgetPasswordViewBody extends StatefulWidget {
  const OtpForgetPasswordViewBody({super.key,

  });

  @override
  State<OtpForgetPasswordViewBody> createState() => _OtpForgetPasswordViewBodyState();
}

class _OtpForgetPasswordViewBodyState extends State<OtpForgetPasswordViewBody> {
  String ?otp;

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

    return BlocConsumer<FogetPasswordCubit, FogetPasswordState>(
      listener: (context, state) {

        if ( state is OtpForgetPasswordSuccess){

          print('sucess send your mail');
        } else if(state is OtpForgetPasswordFailure){
          navigateToPage(AppRouter.kCreateNewPasswordpage, context);
          print('send email in forget password vies body have proble : ${state.error}');
        }
      },
  builder: (context, state) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal:screenWidth*.09  ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                customAppBar(
                  screenHeight: screenHeight,),

                CustomTitle(
                  sizeBox:  screenHeight*.02,
                  fontTitle: .075*MediaQuery.of(context).size.width,
                  fontSubTitle:.039*MediaQuery.of(context).size.width,

                  title: 'OTP Verification',
                  subTitle: 'Enter the verification code we just sent on your email address.'
                      '',
                ),

                CustomTextFormOTP(
                    onCompleted: (pin){
                      otp=pin;
                    },
                    screenHeight: screenHeight,
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
                      onTap:(){
                        if (otp != null && otp!.isNotEmpty) {
                          BlocProvider.of<FogetPasswordCubit>(context).OtpForgetPassword(OTP: otp!);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Please enter the OTP')),
                          );
                        }

                    }


                    // onTap: (){
                    //
                    //   GoRouter.of(context).push(AppRouter.kCreateNewPasswordpage);
                    // },
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
                        onTap: (){
                          BlocProvider.of<OtpSignUpCubit>(context).resendVerificationCode();
                        },
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
        ),
      ),
    );
  },
);
  }
}
