import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SectionPhotoCategory extends StatelessWidget {
  const SectionPhotoCategory({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right:screenWidth*.04 ,
          left: screenWidth*.04
      ) ,
      width: screenWidth,
      height: screenWidth*.4,
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fill,
            image:AssetImage('assets/back_grounds/image 52.png',

            )),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Baby Products',
            style: TextStyle(
                fontWeight: FontWeight.w800,
                //
                fontSize: 25,
                color: Colors.white
            ),
          ),
          Text('Extra care for your baby',

            style: TextStyle(
                fontWeight: FontWeight.w600,
                //
                fontSize: 17,
                color: Colors.white
            ),
          ),

        ],),);
  }
}
