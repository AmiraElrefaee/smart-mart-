import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../const.dart';

class CustomBottonMenuBar extends StatelessWidget {
  const CustomBottonMenuBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.only(top: 15),
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width*.38,
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
              width:   MediaQuery.of(context).size.width*.05
          ),
          SizedBox(width:10 ,),
          Text('50 Points',
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Colors.white
            ),
          )

        ],),
    );
  }
}
