import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../const.dart';
import '../../../../../core/utils/functions/Navigate_to_page.dart';
import '../../../../../core/utils/functions/app_router.dart';
import '../../../../../core/widgets/custom_botton.dart';
import '../../../../../core/widgets/custom_text_form_filed.dart';
import '../../managers/forget_password_cubit/foget_password_cubit.dart';

class sectionFormForgetPassword extends StatefulWidget {
  const sectionFormForgetPassword({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  State<sectionFormForgetPassword> createState() => _sectionFormForgetPasswordState();
}

class _sectionFormForgetPasswordState extends State<sectionFormForgetPassword> {
 late  String mail ;
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(children: [
        CustomTextFormFiled(
          onChanged: (String value) {
            mail = value;
          },
          hint: 'enter your email address',
        ),


        Padding(
          padding:  EdgeInsets.only(top: widget.screenHeight*.05,
              bottom: widget.screenHeight*.03
          ),
          child:  CustomBotton(
              text: 'Send code',
              colorText: Colors.white,
              background:kColor ,
              screenHeight:widget.screenHeight ,
              screenWidth: widget.screenWidth,
              onTap:(){
                if(formKey.currentState!.validate()){
                  BlocProvider.of<FogetPasswordCubit>(context).sendEmail(emial: mail);
               //   navigateToPage(AppRouter.kOtpForgetPasswordPage,context);
                } else {
                  // setState(() {
                  //   autovalidateMode = AutovalidateMode.always;
                  // });
                  print('error in custon form sign up');

                }

              }


            // onTap: (){
            //   GoRouter.of(context).push(AppRouter.kOtpForgetPasswordPage);
            // },
          ),
        ),
      ],),
    );
  }
}
