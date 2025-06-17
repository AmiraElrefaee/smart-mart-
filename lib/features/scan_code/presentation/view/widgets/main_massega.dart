import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../const.dart';

class MainMassege extends StatelessWidget {
  const MainMassege({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(child: SvgPicture.asset('assets/icons/Vector (12).svg',
          width: screenWidth*.13,
        )),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Scan the',
              style: TextStyle(
                fontFamily: 'Urbanis',
                fontSize: screenWidth*.04,
                fontWeight: FontWeight.w600,
                color: Color(0xff263238),
              ),
            ),Text(' barcode',
              style: TextStyle(
                fontFamily: 'Urbanis',
                fontSize: screenWidth*.04,
                fontWeight: FontWeight.w600,
                color: kColor,
              ),
            ),

          ],),

        Text('to add the product to your cart.',
            style: TextStyle(
              fontFamily: 'Urbanis',
              fontSize: screenWidth*.03,
              fontWeight: FontWeight.w600,
              color: Color(0xff263238),
            )),
      ],
    );
  }
}