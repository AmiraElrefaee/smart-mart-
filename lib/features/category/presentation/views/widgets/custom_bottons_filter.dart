import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottonsFilter extends StatelessWidget {
  const CustomBottonsFilter({
    super.key, required this.text, required this.icon,
  });
  final String text;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 5
        ),
        decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xff484C52),
              width: 1,

            ),

            borderRadius: BorderRadius.circular(8)
        ),
        child: Row(
          children: [
            SvgPicture.asset(icon),
            SizedBox(width: 5,),
            Text(text,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff484C52)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
