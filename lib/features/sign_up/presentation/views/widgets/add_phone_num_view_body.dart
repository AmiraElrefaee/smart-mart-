import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_mart/const.dart';


import '../../../../../core/utils/functions/app_router.dart';
import '../../../../../core/widgets/custom_botton.dart';
import '../../../../../core/widgets/custom_side_text.dart';
import '../../../../../core/widgets/custom_title.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import 'custom_form_number.dart';

class AddPhoneNumViewBody extends StatelessWidget {
  const AddPhoneNumViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight= MediaQuery.of(context).size.height;
    double screenWidth= MediaQuery.of(context).size.width;
    return SafeArea(child:
    Padding(
      padding:  EdgeInsets.symmetric(horizontal:screenWidth*.06 ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

        customAppBar(screenHeight: screenHeight),

        CustomTitle(
          sizeBox:  screenHeight*.02,
          fontTitle: .041*MediaQuery.of(context).size.height,
          fontSubTitle:.02*MediaQuery.of(context).size.height,
          title: 'Add phone number',
          subTitle: 'we will send an OTP Verification to you',
        ),
          SizedBox(
            height: screenHeight*.03,
          ),
          Padding(
            padding:  EdgeInsets.symmetric(vertical: screenHeight*.005),
            child: CustomSideText(
              text: 'Phone number',
            ),
          ),
          CustomFormNumber(),

          Spacer(),
          Padding(
            padding:  EdgeInsets.only(bottom: screenHeight*.08),
            child:  CustomBotton(
              text: 'Send me code',
              colorText: Colors.white,
              background:kColor ,
              screenHeight:screenHeight ,
              screenWidth: screenWidth,
              onTap: (){
                GoRouter.of(context).push(AppRouter.kOTPpage);
              },
            ),
          ),

      ],),
    ));
  }
}

