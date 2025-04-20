import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../const.dart';
import '../../../../../core/utils/functions/Navigate_to_page.dart';
import '../../../../../core/utils/functions/app_router.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/custom_botton.dart';
import '../../../../../core/widgets/custom_side_text.dart';
import '../../../../../core/widgets/custom_title.dart';
import '../../../../../core/widgets/custom_text_form_field_password.dart';
import '../../../../../core/widgets/custom_text_form_filed.dart';
import '../../managers/forget_password_cubit/foget_password_cubit.dart';
import 'form_create_new_password.dart';

class CreateNewPasswordPageViewBody extends StatelessWidget {
  const CreateNewPasswordPageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight= MediaQuery.of(context).size.height;
    double screenWidth= MediaQuery.of(context).size.width;
    return BlocConsumer<FogetPasswordCubit, FogetPasswordState>(
  listener: (context, state) {
    if ( state is resetPasswordSuccess){
      navigateToPage(AppRouter.khome, context);
      print('sucess send otp ');
    } else if(state is resetPasswordFailure){

      print('CreateNewPasswordPageViewBody have proble : ${state.error}');
    }
  },
  builder: (context, state) {
    return SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal:screenWidth*.09 ),
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  customAppBar(screenHeight: screenHeight),

                  CustomTitle(
                    sizeBox:  screenHeight*.01,
                    fontTitle: .075*MediaQuery.of(context).size.width,
                    fontSubTitle:.039*MediaQuery.of(context).size.width,
                    title: 'Create new password',
                    subTitle: 'new password must be different from current password',
                  ),
                  SizedBox(
                    height: screenHeight*.03,
                  ),

                  FormCreateNewPassword(),

                ],),
            ),
          ),
        ));
  },
);
  }
}
