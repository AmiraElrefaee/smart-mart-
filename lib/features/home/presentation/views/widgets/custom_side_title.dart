import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class CustomSideTitle extends StatelessWidget {
  const CustomSideTitle({
    super.key,
    required this.screenWidth, required this.icon, required this.text,
  });

  final double screenWidth;
final String icon;
final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(
          top:  screenWidth * .02,
        bottom: screenWidth * .03,
        left:  screenWidth * .08,
      ),
      child: Row(
        children: [
          SvgPicture.asset(icon,
            height: 20,
          ),
          Text(
            text,
            style: TextStyle(
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.w600,

              fontSize: screenWidth * .045,
            ),
          ),
        ],
      ),
    );
  }
}

