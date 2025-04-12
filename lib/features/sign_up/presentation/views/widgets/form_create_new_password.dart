import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../const.dart';
import '../../../../../core/widgets/custom_botton.dart';
import '../../../../../core/widgets/custom_side_text.dart';
import '../../../../../core/widgets/custom_text_form_field_password.dart';
import '../../../../../core/widgets/custom_text_form_filed.dart';
import '../../managers/forget_password_cubit/foget_password_cubit.dart';

class FormCreateNewPassword extends StatefulWidget {
  const FormCreateNewPassword({super.key});

  @override
  State<FormCreateNewPassword> createState() => _FormCreateNewPasswordState();
}

class _FormCreateNewPasswordState extends State<FormCreateNewPassword> {
  final GlobalKey<FormState> formKey = GlobalKey();

  final AutovalidateMode autovalidateMode = AutovalidateMode.always;
  String ?email, pass,copass;


  @override
  Widget build(BuildContext context) {
    double screenHeight= MediaQuery.of(context).size.height;
    double screenWidth= MediaQuery.of(context).size.width;
    return Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
              EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.005),

              child: CustomSideText(
                text: 'Email address',
              ),),
            CustomTextFormFiled(
              onChanged: (String value) {
                email = value;
              },
              hint: 'enter your email address',
            ),
          Padding(
            padding:
            EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.005),

            child: CustomSideText(
              text: 'New password',
            ),),

          CustomTextFieldPassWord(
            hint: 'New password',
            onChanged: (text){
              pass=text ;
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*.01,
          ),
          Padding(
            padding:
            EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.005),
            child: CustomSideText(
              text: 'Confirm Password',
            ),),

          CustomTextFieldPassWord(
            onChanged: (text){
              copass=text;
            },
            hint: 'confirm password',
          ),
            SizedBox(height: screenHeight * .2),
            CustomBotton(
              text: 'Reset Password',
              background: kColor,
              colorText: Colors.white,
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              onTap: (){
                if (formKey.currentState!.validate()){
                  BlocProvider.of<FogetPasswordCubit>(context).resetPassword(
                      email: email!, password: pass!, coPassword: copass!);
                } else {

                }
              },
            )


        ],)

    );
  }
}
