import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../const.dart';

class CustomAddOrMinusBotton extends StatefulWidget {
  const CustomAddOrMinusBotton({
    super.key, required this.screenWidth, required this.screenHeight, required this.number,
  });
final double screenWidth;
final double screenHeight;
final num  number;
  @override
  State<CustomAddOrMinusBotton> createState() => _CustomAddOrMinusBottonState();
}

class _CustomAddOrMinusBottonState extends State<CustomAddOrMinusBotton> {
  int num=1;
  @override
  Widget build(BuildContext context) {
    return
        Container(
          // padding: EdgeInsets.symmetric(horizontal: 1),
          width:widget. screenWidth,
          height:widget. screenHeight ,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Color(0xffF5F5F5),
              borderRadius: BorderRadius.circular(10)
          ),
      child: Text(' X${widget.number}',
        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600
        ),
      ),
    );
  }
}
