import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_mart/features/sign_up/presentation/views/widgets/section_form_forget_password.dart';

import '../../../../../const.dart';
import '../../../../../core/utils/functions/Navigate_to_page.dart';
import '../../../../../core/utils/functions/app_router.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/custom_botton.dart';
import '../../../../../core/widgets/custom_side_text.dart';
import '../../../../../core/widgets/custom_title.dart';
import '../../../../../core/widgets/custom_text_form_filed.dart';
import '../../managers/forget_password_cubit/foget_password_cubit.dart';
import 'custom_form_number.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight= MediaQuery.of(context).size.height;
    double screenWidth= MediaQuery.of(context).size.width;
    return BlocConsumer<FogetPasswordCubit, FogetPasswordState>(
  listener: (context, state) {

   if ( state is senEmailSuccess){
    print('sucess send your mail');
   } else if(state is senEmailFailure){
     navigateToPage(AppRouter.kOtpForgetPasswordPage, context);
     print('send email in forget password vies body have proble : ${state.errorMess}');
   }
  },
  builder: (context, state) {
    return SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal:screenWidth*.09  ),
                  child: SingleChildScrollView(
                    child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              customAppBar(screenHeight: screenHeight),

              CustomTitle(
                sizeBox:  screenHeight*.02,
                fontTitle: .075*MediaQuery.of(context).size.width,
                fontSubTitle:.039*MediaQuery.of(context).size.width,
                title: 'Forgot Password ?',
                subTitle: 'Don t worry! It occurs. Please enter the email address linked with your account.',
              ),
              SizedBox(
                height: screenHeight*.03,
              ),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: screenHeight*.005),
                child: CustomSideText(
                  text: 'Email address',
                ),
              ),

              sectionFormForgetPassword(screenHeight: screenHeight,
                  screenWidth: screenWidth),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Remember Password ?',
                    style: Styles.Urbanist25.copyWith(color: kcolor3,
                        fontSize: screenHeight*.018),),

                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: InkWell(
                      onTap: (){
                        GoRouter.of(context).pop();
                        // navigateToPage(AppRouter.kloginPage, context);
                      },
                      child: Text(' Log in',
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
          ));
  },
);
  }
}

