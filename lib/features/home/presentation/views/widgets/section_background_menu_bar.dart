import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_mart/core/utils/functions/app_router.dart';

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
          top:  MediaQuery.of(context).size.height*.11,
          left:  MediaQuery.of(context).size.width*.27,
          width: 103.w,
          height: 29.h
          ,
          child: Container(
            // padding: EdgeInsets.symmetric(
            //     vertical: 8
            // ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
            ),
            child: InkWell(
              onTap: (){
                context.go(AppRouter.kScanPage);
              },
              child: Text('Scan',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: kColor,
                    fontSize:  14.sp,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w500
                ),
              ),
            ),),
        ),

      ],
    );
  }
}
