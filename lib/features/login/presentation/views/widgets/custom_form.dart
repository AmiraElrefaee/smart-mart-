import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_mart/core/utils/functions/app_router.dart';
import 'package:smart_mart/features/login/presentation/views/widgets/section_bottons.dart';
import 'package:smart_mart/features/login/presentation/views/widgets/section_google_botton.dart';
import 'package:smart_mart/features/login/presentation/views/widgets/separate_line_section.dart';
import 'package:smart_mart/core/widgets/side_title_section.dart';

import '../../../../../const.dart';
import '../../../../../core/utils/functions/Navigate_to_page.dart';
import '../../../../../core/widgets/custom_botton.dart';
import 'custom_check_box.dart';
import '../../../../../core/widgets/custom_side_text.dart';
import '../../../../../core/widgets/custom_text_botton.dart';
import '../../../../../core/widgets/custom_text_form_field_password.dart';
import '../../../../../core/widgets/custom_text_form_filed.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({
    super.key, required this.screenHeight, required this.screenWidth,
  });
  final double screenHeight;
  final double screenWidth;
  @override
  State<CustomForm> createState() => _addNoteFormState();
}

class _addNoteFormState extends State<CustomForm> {
  @override
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String ?title, subTitle;
  double ?space ;
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SideTitleSection(text: 'Email address',),


          Padding(
            padding:   EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height*.008
            ),
            child: CustomTextFormFiled(
              onSaved: (value) {
                title = value;
              },
              hint: 'enter your email address',
            ),
          ),

          SideTitleSection(text: 'Password',),

          Padding(
            padding:  EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height*.008
            ),
            child: CustomTextFieldPassWord(
              onSaved: (value) {
                subTitle = value;
              },
              hint: 'enter your password',


            ),
          ),
          // SizedBox(
          //   height: widget.screenHeight*.01,
          // ),

          CustomCheckBox(
            screenWidth: widget.screenWidth,
            screenHeight: widget.screenHeight,
          ),

          SizedBox(
            height:widget.screenHeight*.015,
          ),

          CustomBotton(
            onTap: (){
              if (formKey.currentState!.validate()){
                
                navigateToPage(AppRouter.khome, context);
                setState(() {
                  space=widget. screenHeight*.025;
                });
              }else {
                setState(() {
                  space=widget. screenHeight*.01;
                });
              }
              },
            screenHeight:widget. screenHeight*.7,
            screenWidth: widget.screenWidth,
            background: kColor,
            colorText: Colors.white,
            text: 'Log in ',
          ),

          SizedBox(
            height: space?? widget.screenHeight*.025,
          ),

          SeparateLineSection(
            screenHeight: widget. screenHeight,
            screenWidth: widget. screenWidth,
          ),

          SizedBox(
            height:space ?? widget. screenHeight*.025,
          ),

          SectionGoogleBotton(
            screenHeight:  widget.screenHeight,
            screenWidth: widget. screenWidth,
          ),


          // BlocBuilder<AddNoteCubit, AddNoteState>(
          //   builder: (context, state) {
          //     return CustomBottom(
          //       isLoading: state is AddNoteLoading ? true : false,
          //       onTap: () {
          //         if (formKey.currentState!.validate()) {
          //           formKey.currentState!.save();
          //           saveNote(context);
          //
          //         } else {
          //           autovalidateMode = AutovalidateMode.always;
          //           setState(() {
          //
          //           });
          //         }
          //       },
          //     );
          //   },
          // ),

        ],
      ),
    );
  }

  // void saveNote(BuildContext context) {
  //   DateTime now=DateTime.now();
  //   String formattedDay=DateFormat('yyy-MM-dd').format(now);
  //   var notModel = NoteModel(title: title!,
  //       subTitle: subTitle!,
  //       date: formattedDay,
  //       color: Colors.brown.value);
  //   BlocProvider.of<AddNoteCubit>(context).addNote(notModel);
  // }
}


