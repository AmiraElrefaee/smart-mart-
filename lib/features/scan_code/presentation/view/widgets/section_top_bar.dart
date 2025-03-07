import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../const.dart';

class SectionTopBar extends StatelessWidget {
  const SectionTopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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

            SvgPicture.asset('assets/icons/Vector (11).svg',
              color: Color(0xff484C52),
              width: 27,
            ),
            Text('  Scanned Product',
              style: TextStyle(
                  fontFamily: 'Urbanist',
                  color: Color(0xff484C52),
                  fontSize: 20,
                  fontWeight: FontWeight.w600
              ),
            )
          ],),


      ],),
    );
  }
}

