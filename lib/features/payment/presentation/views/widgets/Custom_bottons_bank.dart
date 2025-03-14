import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBottonsBank extends StatelessWidget {
  const CustomBottonsBank({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.title,
    required this.color, required this.photo,
  });

  final double screenWidth;
  final double screenHeight;
  final String title;
  final Color color;
  final String photo;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: screenWidth*.1,
          right: screenWidth*.07
      ),
      width: screenWidth,
      // height: 50,
      decoration: BoxDecoration(
          color:color,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              width: 1,
              color: Color(0xffD9D9D9)
          )
      ),
      child:
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(photo,

            height: screenHeight*.055,
            width: screenWidth*.15,
          ),

          Text(title,
            style: TextStyle(
                fontFamily: 'Urbanist',
                fontSize:
                screenWidth*.04,
                color: Color(0xff989797),
                fontWeight: FontWeight.w600
            ),
          ),
          InkWell(
            onTap: (){},
            child: Icon(Icons.keyboard_arrow_right_rounded,
              size: screenWidth*.08,
              color: Color(0xff484C52),
            ),
          )
        ],),


    );
  }
}






