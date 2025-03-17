import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_mart/const.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;
  final int? maxLength;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hint,
    this.keyboardType,
    this.inputFormatters,
    this.obscureText = false,
    this.maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      maxLength: maxLength,
      decoration: InputDecoration(

        counterText: "",
        hintText: hint,
        hintStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontFamily: 'Urbanist',
          fontSize: 16,
          color: Color(0xff989797), // Replace with kcolor3 if needed
        ),
        focusedBorder:buildOutlineInputBorder()  ,
        enabledBorder:buildOutlineInputBorder() ,
        border: buildOutlineInputBorder(),
        errorBorder: buildOutlineInputBorder(color: kColor),
          focusedErrorBorder: buildOutlineInputBorder(color: kColor)




      ),
      validator: (value) => value == null || value.isEmpty ? "This field cannot be empty" : null,
    );
  }

  OutlineInputBorder buildOutlineInputBorder({Color ?color}) {

    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide:  BorderSide(color: color ==null?Color(0xffD8DADC):color,
        width: 1
        ),
      );
  }
}
