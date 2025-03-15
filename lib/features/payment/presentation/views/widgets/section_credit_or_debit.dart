import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../const.dart';

class SectionCrediaOrDebit extends StatelessWidget {
  const SectionCrediaOrDebit({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      width: screenWidth,
      decoration:const  BoxDecoration(
          color: kColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          )
      ),
      child: Row(

        children: [
          const    Icon(Icons.credit_card,
            color: Colors.white,
          ),
          const    Text('   Credit / Debit Card',
            style: TextStyle(
                fontSize: 17,
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w600,
                color: Colors.white
            ),
          )],


      ),
    );
  }
}
