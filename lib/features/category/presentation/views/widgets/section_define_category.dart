import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../const.dart';
import '../../../../home/presentation/views/widgets/custom_side_title.dart';

class sectionDefineCategory extends StatelessWidget {
  const sectionDefineCategory({
    super.key,
    required this.screenWidth,
    required this.title,
  });

  final double screenWidth;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomSideTitle(
          screenWidth: screenWidth,
          color: kcolor4,
          text: '  All Categories',
          icon: 'assets/icons/Group 6.svg',
        ),
        SizedBox(width: 10,),
        Icon(Icons.arrow_forward_ios_outlined,
          size: screenWidth*.04,
          color: kcolor4,
        ),
        SizedBox(width: 10,),
        Text(title,
          style: TextStyle(
              color: kColor,
              fontSize: 16,
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.w600
          ),
        )],
    );
  }
}
