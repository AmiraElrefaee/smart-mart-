import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SectionBottonsAddNew extends StatelessWidget {
  const SectionBottonsAddNew({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: screenWidth*.1,
          right: screenWidth*.07
      ),
      width: screenWidth,
      height:  screenHeight*.055,
      decoration: BoxDecoration(
          color: Color(0xffF8F8F8),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              width: 1,
              color: Color(0xffD9D9D9)
          )
      ),
      child:InkWell(
        onTap: (){},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add,
              color: Color(0xff484C52),
              weight: 200,
              size: 25,

            ),

            Text('  Add New',
              style: TextStyle(
                  fontFamily: 'Urbanist',
                  color: Color(0xff484C52),
                  fontSize: 17,
                  fontWeight: FontWeight.w600
              ),
            )
          ],
        ),
      ),);
  }
}
