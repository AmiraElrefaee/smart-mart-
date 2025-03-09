import 'package:flutter/cupertino.dart';

import '../../../../../const.dart';
import '../../../../../core/utils/styles.dart';
import 'custom_add_or_minus.dart';

class customDetailsSCannedItem extends StatelessWidget {
  const customDetailsSCannedItem({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(

          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  width: 1 ,
                  color: Color(0xffDADADA)
              )
          ),
          child: Image.asset('assets/items/image 15.png',
            height: screenHeight*.11,
            width: screenWidth*.18,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text('Vitrac Strawberry Jam ',
              style: Styles.NexaBold14.copyWith(
                  fontWeight: FontWeight.w500
              ),

            ),
            Text(' 850 gm',
              style: Styles.NexaBold14.copyWith(
                  fontWeight: FontWeight.w500
              ),),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('EGP 64.95',
                  style: TextStyle(
                      fontFamily: 'Urbanist'
                      ,fontSize: 16,
                      color: kColor,
                      fontWeight: FontWeight.w600
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text('EGP 64.95',

                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    fontFamily: 'Urbanist'
                    ,fontSize: 16,
                    color: Color(0xff989797),
                    fontWeight: FontWeight.w600,

                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            // Container(
            //   width: 140, // عرض الخط
            //   height: 1, // طول الخط
            //   color: Color(0xffDADADA), // لون الخط
            // ),
            SizedBox(
              height: 5,
            ),

            // CustomPrice(screenWidth: screenWidth),
            SizedBox(height: 10,)

          ],),
        Padding(
          padding:  EdgeInsets.only(top: screenWidth*.05),
          child: CustomAddOrMinusBotton(
            screenHeight:32,
            screenWidth: screenWidth*.21,
          ),
        )

      ],
    );
  }
}

