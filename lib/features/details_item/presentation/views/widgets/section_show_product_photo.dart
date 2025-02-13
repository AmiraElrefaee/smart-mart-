import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SectionShowProductPhoto extends StatelessWidget {
  const SectionShowProductPhoto({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(


          width: screenWidth,
          height: screenWidth*.56,
          alignment: Alignment.topCenter,
          margin: EdgeInsets.symmetric(vertical: screenWidth*.06),
          decoration: BoxDecoration(
              color: Color(0xffF8F8F8),
              borderRadius: BorderRadius.circular(8)
          ),
          child:
          Image.asset('assets/items/image 47.png',
            // height: screenWidth*.55,
          ),
        ),

        Positioned(
            left: screenWidth*.78,
            top: screenWidth*.12,
            child: InkWell(
              onTap: (){},
              child: SvgPicture.asset('assets/icons/Vector (4).svg',
                height: screenWidth*.05,
              ),
            )),
        Positioned(
            left: screenWidth*.78,
            top: screenWidth*.23,
            child: InkWell(
              onTap: (){},
              child: SvgPicture.asset('assets/icons/Vector (5).svg',
                height: screenWidth*.05,
              ),
            )),
      ],
    );
  }
}

