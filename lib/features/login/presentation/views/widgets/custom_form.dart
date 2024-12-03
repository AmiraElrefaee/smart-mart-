import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_mart/features/login/presentation/views/widgets/section_bottons.dart';
import 'package:smart_mart/features/login/presentation/views/widgets/section_google_botton.dart';
import 'package:smart_mart/features/login/presentation/views/widgets/separate_line_section.dart';
import 'package:smart_mart/core/widgets/side_title_section.dart';

import '../../../../../const.dart';
import '../../../../../core/widgets/custom_botton.dart';
import 'custom_check_box.dart';
import '../../../../../core/widgets/custom_side_text.dart';
import '../../../../../core/widgets/custom_text_botton.dart';
import 'custom_text_form_field_password.dart';
import 'custom_text_form_filed.dart';

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
          SizedBox(
            height: widget.screenHeight*.01,
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


