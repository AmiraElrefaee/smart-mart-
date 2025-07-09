import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../const.dart';

class CustomBottonMenuBar extends StatelessWidget {
  const CustomBottonMenuBar({
    super.key, required this.heightBotton, required this.widthBotton,
  });
final double heightBotton;
final double widthBotton;
  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.only(top: 15),
      alignment: Alignment.center,
      width:widthBotton,
      height: heightBotton,
      padding: EdgeInsets.symmetric(
          horizontal:  MediaQuery.of(context).size.width*.05,
          vertical: 6
      ),
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              kColor,
              Color(0xffCC0000)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,),

          borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/icons/gift.svg',
              width:   16.w
          ),
          SizedBox(width:10 ,),
          Text('50 Points',
            style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white
            ),
          )

        ],),
    );
  }
}
