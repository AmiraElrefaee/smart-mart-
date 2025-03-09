import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../const.dart';

class SectionTopBarScannedItem extends StatelessWidget {
  const SectionTopBarScannedItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.only(bottom: 20,
            top: 20
        ),
        decoration: BoxDecoration(
          color: Colors.white, // Background color
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color:ksecodaryColor.withOpacity(0.1), // Shadow color with opacity
              spreadRadius: .5, // How much the shadow spreads
              blurRadius: 2, // Blurriness of the shadow
              offset: Offset(0, 4), // Moves shadow down (X: 0, Y: 4)
            ),
          ],
        ),
        child: Column(children: [
          Container(
            margin:EdgeInsets.only(
                bottom: 25
            ),
            width: MediaQuery.of(context).size.width*.35,
            height: 5,

            decoration: BoxDecoration(
                color: Color(0xffDADADA),
                borderRadius: BorderRadius.circular(20)
            ),

          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Cart ',
                style: TextStyle(
                    fontFamily: 'Urbanist',
                    color: Color(0xff484C52),
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                ),
              )
              , Text('( 3 items )',
                style: TextStyle(
                    fontFamily: 'Urbanist',
                    color: Color(0xff989797),
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                ),
              )
            ],),


        ],),
      ),
    );
  }
}
