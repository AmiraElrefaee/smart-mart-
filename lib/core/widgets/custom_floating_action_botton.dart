import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../const.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key, required this.onItemTapped,
  });
  final VoidCallback onItemTapped; // تعديل النوع هنا
  @override
  Widget build(BuildContext context) {
    double le=.18;
    return Container(
      width: MediaQuery.of(context).size.width * le,
      height: MediaQuery.of(context).size.width * le,
      margin: const EdgeInsets.only(top: 80),
      child: FloatingActionButton(
        onPressed: onItemTapped, // تعديل هنا
        backgroundColor: kColor,
        shape: CircleBorder(
          eccentricity: .1,
        ),
        child: SvgPicture.asset(
          'assets/icons/Vector (8).svg',
          height: MediaQuery.of(context).size.width * .104,
        ),
      ),
    );
  }
}