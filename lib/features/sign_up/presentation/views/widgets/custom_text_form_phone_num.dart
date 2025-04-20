import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/styles.dart';


class CustomTextFormPhoneNum extends StatelessWidget {
  const CustomTextFormPhoneNum({super.key,
  this.onChanged,
    this.onSaved
  });
 final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged:onChanged ,
      onSaved:onSaved ,
      keyboardType: TextInputType.phone,
      validator: (value){
        if (value?.isEmpty?? true){
          return 'field is require';
        }
        else if (value is num ){
          return 'phone number is require';
        }
        else{
          return null;
        }
      },

      // maxLines: maxlines,
      style:Styles.Urbanist20.copyWith(
          fontSize: MediaQuery.of(context).size.height*.019,
          color: Colors.black,fontWeight: FontWeight.w500),
      // cursorColor: kprimaryColor,
      decoration: InputDecoration(

          prefixIcon:Padding(
            padding: const EdgeInsets.all(15.0),
            child: SvgPicture.asset('assets/images/Frame 36724.svg'),
          ) ,


          hintText:'enter your phone number',
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
        borderRadius: BorderRadius.circular(15),
        borderSide:  BorderSide(
            color: colorr==null? Color(0xffD8DADC):colorr,
            width:widthh==null? 2:widthh)
    );
  }
}
