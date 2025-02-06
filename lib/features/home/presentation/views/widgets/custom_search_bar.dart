import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../const.dart';
import '../../../../../core/utils/styles.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key, required this.screenWidth});


  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      // onChanged: (String value) => _cubit.FetchSeared(title: value),
        style:  TextStyle(
          fontSize: screenWidth*.03,
        ),
        maxLines: 1,
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xffF5F5F5),
          enabledBorder: buildOutlineInputBorder(),
          focusedBorder: buildOutlineInputBorder(),
          hintText: 'What do you want ?',
          hintStyle: Styles.NexaBold14.copyWith(
            color: Color(0xff484C52),
          ),
          labelStyle: const TextStyle(fontSize: 20),
          prefixIcon: IconButton(onPressed: (){},
              icon: SvgPicture.asset('assets/icons/icon-park-outline_search.svg')),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.qr_code_scanner_outlined,
              color:  kColor,
              size:screenWidth*.06 ,
            ),
          ),
        ));
  }
  OutlineInputBorder buildOutlineInputBorder() {
    return  OutlineInputBorder(

        borderRadius:  BorderRadius.circular(10),
        borderSide: const BorderSide(width: 2, color: Color(0xffF5F5F5)));
  }
}
