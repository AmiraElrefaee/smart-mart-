import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class sectonArrowBack extends StatelessWidget {
  const sectonArrowBack({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(right: screenWidth*.05),
      child: InkWell(onTap: (){}, child: Icon(Icons.arrow_back_ios_new_outlined,
        size: screenWidth*.06,
        color: Color(0xff484C52),
      )),
    );
  }
}
