import 'package:flutter/cupertino.dart';

import '../../../../../core/widgets/custom_side_text.dart';
import '../../../../../core/widgets/custom_text_form_field_password.dart';

class FormCreateNewPassword extends StatefulWidget {
  const FormCreateNewPassword({super.key});

  @override
  State<FormCreateNewPassword> createState() => _FormCreateNewPasswordState();
}

class _FormCreateNewPasswordState extends State<FormCreateNewPassword> {
  final GlobalKey<FormState> formKey = GlobalKey();

  final AutovalidateMode autovalidateMode = AutovalidateMode.disabled;



  @override
  Widget build(BuildContext context) {
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
              text: 'New password',
            ),),

          CustomTextFieldPassWord(
            hint: 'New password',
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
            hint: 'confirm password',
          ),


        ],)

    );
  }
}
