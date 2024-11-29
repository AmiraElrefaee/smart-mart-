import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_mart/features/login/presentation/views/widgets/side_title_section.dart';
import 'package:smart_mart/utils/styles.dart';

import 'custom_text_form_field_password.dart';
import 'custom_text_form_filed.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({
    super.key,
  });

  @override
  State<CustomForm> createState() => _addNoteFormState();
}

class _addNoteFormState extends State<CustomForm> {
  @override
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String ?title, subTitle;

  Widget build(BuildContext context) {
    return Positioned(

      width: MediaQuery.of(context).size.width,
      top: MediaQuery.of(context).size.height * .47,
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SideTitleSection(text: 'Email address',),


            Padding(
              padding:   EdgeInsets.only(right: MediaQuery.of(context).size.width*.05
                  ,left: MediaQuery.of(context).size.width*.05,
                  bottom: MediaQuery.of(context).size.width*.03
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
              padding:  EdgeInsets.only(right: MediaQuery.of(context).size.width*.05
              ,left: MediaQuery.of(context).size.width*.05,
                bottom: MediaQuery.of(context).size.width*.03
              ),
              child: CustomTextFieldPassWord(
                onSaved: (value) {
                  subTitle = value;
                },
                hint: 'enter your password',


              ),
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


