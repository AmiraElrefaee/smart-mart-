import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_mart/features/login/presentation/views/widgets/section_bottons.dart';
import 'package:smart_mart/features/login/presentation/views/widgets/section_google_botton.dart';
import 'package:smart_mart/features/login/presentation/views/widgets/separate_line_section.dart';
import 'package:smart_mart/core/widgets/side_title_section.dart';


import '../../../../../const.dart';
import '../../../../../core/utils/functions/Navigate_to_page.dart';
import '../../../../../core/utils/functions/app_router.dart';
import '../../../../../core/widgets/custom_botton.dart';
import '../../../../../core/widgets/custom_side_text.dart';
import '../../../../../core/widgets/custom_text_form_field_password.dart';
import '../../../../../core/widgets/custom_text_form_filed.dart';
import '../../../domain/entity/register_entity.dart';
import '../../managers/register_cubit/register_cubit.dart';
import 'custom_form_number.dart';
import 'custom_text_form_phone_num.dart';


class CustonFormSignup extends StatefulWidget {
  const CustonFormSignup({
    super.key, required this.screenHeight, required this.screenWidth,
  });
  final double screenHeight;
  final double screenWidth;
  @override
  State<CustonFormSignup> createState() => _addNoteFormState();
}

class _addNoteFormState extends State<CustonFormSignup> {
  @override
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String ?fname, lname, pass, copass,mail;
  num ?phone;
   // RegisterEntity user;

  Widget build(BuildContext context) {
    final double bottom=MediaQuery.of(context).size.height*.015;
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SideTitleSection(text: 'First name',),

          Padding(
            padding:   EdgeInsets.only(
                bottom: bottom
            ),
            child: CustomTextFormFiled(
              onChanged: (String value) {
                fname = value;
              },
              hint: 'enter your first name',
            ),
          ),

          SideTitleSection(text: 'Last name',),

          Padding(
            padding:   EdgeInsets.only(
                bottom:bottom
            ),
            child: CustomTextFormFiled(
              onChanged: ( String value) {
                lname = value;
              },
              hint: 'enter your last name',
            ),
          ),

          SideTitleSection(text: 'Email address',),

          Padding(
            padding:   EdgeInsets.only(
                bottom: bottom
            ),
            child: CustomTextFormFiled(
              onChanged: (String value) {
                mail = value;
              },
              hint: 'enter your email address',
            ),
          ),

          SideTitleSection(text: 'Phone number',),
          CustomTextFormPhoneNum(
            onChanged: ( value){
              phone=value as num;
              },
          ),
          // CustomFormNumber(
          //   on
          // ),
          SideTitleSection(text: 'Password',),

          Padding(
            padding:  EdgeInsets.only(
              bottom:   bottom
            ),
            child: CustomTextFieldPassWord(
              onChanged: ( String value) {
                pass = value;
              },
              hint: 'enter your password',
            ),
          ),

          SideTitleSection(text: 'Confirm Password',),

          Padding(
            padding:  EdgeInsets.only(
              bottom: bottom
            ),
            child: CustomTextFieldPassWord(
              onChanged: (String value) {
                copass = value;
              },
              hint: 'enter your password',
            ),
          ),

          SizedBox(
            height: widget.screenHeight*.01,
          ),
          CustomBotton(
              text: 'Continue',
              background: kColor,
              colorText: Colors.white,
              screenWidth: widget.screenWidth,
              screenHeight:widget.screenHeight ,
              onTap:(){

                  if (formKey.currentState!.validate()){
                    // navigateToPage(AppRouter.kAddPhoneNumPage, context);
                    print('not error ');
                    if (fname != null && lname != null && mail != null && pass != null && copass != null) {
                      BlocProvider.of<RegisterCubit>(context).register(
                        fname: fname!,
                        lname: lname!,
                        mail: mail!,
                        pass: pass!,
                        copass: copass!,
                        phone: phone!
                      );
                    }
                    // context.read<RegisterCubit>()
                    //     .register('asdsd', 'hasd', 'asessd@gmail.com', 'securePas', 'securePas');
                  }else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                   print('error in custon form sign up');

                  }


              }
          ),


        ],
      ),
    );
  }

}


