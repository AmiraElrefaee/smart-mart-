import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../const.dart';

class CustomAddOrMinusBotton extends StatefulWidget {
  const CustomAddOrMinusBotton({
    super.key, required this.screenWidth, required this.screenHeight,
  });
final double screenWidth;
final double screenHeight;
  @override
  State<CustomAddOrMinusBotton> createState() => _CustomAddOrMinusBottonState();
}

class _CustomAddOrMinusBottonState extends State<CustomAddOrMinusBotton> {
  int num=1;
  @override
  Widget build(BuildContext context) {
    return
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          width:widget. screenWidth,
          height:widget. screenHeight ,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Color(0xffF5F5F5),
              borderRadius: BorderRadius.circular(10)
          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Align(
            alignment: Alignment.center,
            child: InkWell(onTap: (){
              if(num>0) setState(() {
                num--;
              });

            }
                , child: Icon(Icons.minimize,
                  size: widget.screenWidth*.2,
                  color: Color(0xff484C52),
                )),
          ),
          Text('$num',
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: InkWell(
                onTap: (){
                  setState(() {
                    num++;
                  });

                }
                , child: Icon(Icons.add,
                  color: kColor,
              size: widget.screenWidth*.2,
                )),
          ),

        ],
      ),
    );
  }
}
