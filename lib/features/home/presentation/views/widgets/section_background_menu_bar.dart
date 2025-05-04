import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../const.dart';

class SectionBackgroundMenuBar extends StatelessWidget {
  const SectionBackgroundMenuBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          // top:  MediaQuery.of(context).size.height*.036,
          // left: 0,
          // right: 0,
          // bottom: 2,
          child: Center(
            child: SvgPicture.asset('assets/back_grounds/background_menuBar.svg',
              width: MediaQuery.of(context).size.width,
              height:  MediaQuery.of(context).size.width*.48,
              fit: BoxFit.fill,

            ),
          ),
        ),

        Positioned(
          top:  MediaQuery.of(context).size.height*.036,
          left:  MediaQuery.of(context).size.width*.2,
          child: SvgPicture.asset('assets/back_grounds/Frame 1984078145.svg',
            width:MediaQuery.of(context).size.width*.4 ,
          ),
        ),

        Positioned(
          top:  MediaQuery.of(context).size.height*.12,
          left:  MediaQuery.of(context).size.width*.27,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40,
                vertical: 8
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
            ),
            child: Text('Scan',

              style: TextStyle(
                  color: kColor,
                  fontSize:  MediaQuery.of(context).size.width*.03,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w500
              ),
            ),),
        ),

      ],
    );
  }
}
