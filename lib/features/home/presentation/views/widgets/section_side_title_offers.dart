import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class sectionSideTitleOfferrs extends StatelessWidget {
  const sectionSideTitleOfferrs({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: screenWidth * .08,
          top:  screenWidth * .04
      ),
      child: Row(
        children: [
          SvgPicture.asset('assets/icons/Vector (3).svg',
            height: 20,
          ),
          Text(
            ' Offers',
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

