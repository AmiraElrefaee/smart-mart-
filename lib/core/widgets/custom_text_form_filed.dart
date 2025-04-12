import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_mart/const.dart';

import '../utils/styles.dart';

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
        }
        else if ( hint=='enter your email address'&&!value!.contains('@')){
          return 'Invalid email. Please try again.';
        }
        else{
          return null;
        }
      },

      maxLines: maxlines,
      style:Styles.Urbanist20.copyWith(
          fontSize: MediaQuery.of(context).size.height*.019,
          color: Colors.black,fontWeight: FontWeight.w500),


      decoration: InputDecoration(
        focusedErrorBorder: buildBorder(
            Color(0xffFFA9AC),
            2.0
        ),
        errorStyle: TextStyle(fontSize: MediaQuery.of(context).size.height*.017,
              fontWeight: FontWeight.w400,
              color: kColor
          ),

          errorBorder: buildBorder(
            Color(0xffFFA9AC),
            2.0
          ),
          hintText:hint,
          hintStyle: Styles.Urbanist20.copyWith(
            color: Colors.black.withOpacity(0.5),
              fontSize: MediaQuery.of(context).size.height*.019,
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
        borderRadius: BorderRadius.circular(10),
        borderSide:  BorderSide(
            color: colorr==null? Color(0xffD8DADC):colorr,
            width:widthh==null? 2:widthh)
    );
  }
  }

