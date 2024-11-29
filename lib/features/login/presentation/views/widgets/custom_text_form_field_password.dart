import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_mart/utils/styles.dart';



class CustomTextFieldPassWord extends StatefulWidget {
   const CustomTextFieldPassWord({super.key,
    required this.hint,
    this.maxlines=1,this.onSaved,
    this.onChanged,});

  final String hint;
  final int maxlines;
  final void Function(String)? onChanged;
  final  void Function(String?)? onSaved;

  @override
  State<CustomTextFieldPassWord> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextFieldPassWord> {

bool obscureText=true ;
  @override
  Widget build(BuildContext context) {
    return TextFormField(

      obscureText:obscureText,
      onChanged:widget.onChanged ,
      onSaved:widget.onSaved ,
      validator: (value){
        if (value?.isEmpty?? true){
          return 'field is require';
        }else{
          return null;
        }
      }
      ,

      maxLines: widget.maxlines,
      style:Styles.Urbanist16.copyWith(color: Colors.black),
      // cursorColor: kprimaryColor,
      decoration: InputDecoration(
        suffixIcon:InkWell(onTap:(){
          setState(() {
            obscureText=!obscureText;
          });

        } ,child:  obscureText==true?
        Padding(
          padding:  EdgeInsets.only(right: MediaQuery.of(context).size.width*.04),
          child: SvgPicture.asset('assets/images/Component 16.svg',


              ),
        ):
        Padding(
          padding:  EdgeInsets.only(right: MediaQuery.of(context).size.width*.04),
          child: SvgPicture.asset('assets/images/eye_show_regular_icon_203603.svg'),
        ),),



        // IconButton(
        //   onPressed: (){
        //     setState(() {
        //       obscureText=! obscureText;
        //
        //     });
        //
        //   },
        //   icon: 
        //  
        //   obscureText==true ?
        //   Icon(FontAwesomeIcons.eye):Icon(FontAwesomeIcons.eyeSlash),),
        hintText:widget.hint,
        hintStyle: Styles.Urbanist20.copyWith(
            color: Colors.black.withOpacity(0.5),
        // fontSize: MediaQuery.of(context).size.width*0001
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
