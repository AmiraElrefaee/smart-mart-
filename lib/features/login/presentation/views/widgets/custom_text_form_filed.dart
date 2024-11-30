import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/styles.dart';

class CustomTextFormFiled extends StatelessWidget {

  const CustomTextFormFiled({super.key,
    required this.hint,
    this.maxlines=1,this.onSaved,
    this.onChanged,});
  final String hint;
  final int maxlines;
  final void Function(String)? onChanged;
  final  void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged:onChanged ,
      onSaved:onSaved ,

      validator: (value){
        if (value?.isEmpty?? true){
          return 'field is require';
        }else{
          return null;
        }
      },

      maxLines: maxlines,
      style:Styles.Urbanist20.copyWith(
          fontSize: MediaQuery.of(context).size.width*.04,
          color: Colors.black,fontWeight: FontWeight.w500),
      // cursorColor: kprimaryColor,
      decoration: InputDecoration(


          hintText:hint,
          hintStyle: Styles.Urbanist20.copyWith(
            color: Colors.black.withOpacity(0.5),
              fontSize: MediaQuery.of(context).size.width*.04,
            fontWeight: FontWeight.w500
          ),
          border: buildBorder(),
          enabledBorder:buildBorder(),
          focusedBorder: buildBorder( Color(0xffD8DADC),3.0)
      ),
    );
  }

  OutlineInputBorder buildBorder([colorr,widthh]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide:  BorderSide(
            color: colorr==null? Color(0xffD8DADC):colorr,
            width:widthh==null? 2:widthh)
    );
  }
  }

