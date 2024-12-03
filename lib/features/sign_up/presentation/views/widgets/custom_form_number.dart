import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


import 'custom_text_form_phone_num.dart';

class CustomFormNumber extends StatefulWidget {
  const CustomFormNumber({super.key,
  });

  @override
  State<CustomFormNumber> createState() => _CustomFormNumberState();
}

class _CustomFormNumberState extends State<CustomFormNumber> {
  final GlobalKey<FormState> formKey = GlobalKey();

  final AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child:CustomTextFormPhoneNum()

    );
  }

}
