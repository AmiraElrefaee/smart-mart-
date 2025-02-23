import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../const.dart';

class FailMassege extends StatelessWidget {
  const FailMassege({
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
        Center(child: Icon(Icons.error_outline,
          color: kColor,
          size: screenWidth*.1,
        ),),


        Text('This item currently unavaliable',
            style: TextStyle(
              fontFamily: 'Urbanis',
              fontSize: screenWidth*.05,
              fontWeight: FontWeight.w600,
              color: Color(0xff263238),
            )),
      ],
    );
  }
}
