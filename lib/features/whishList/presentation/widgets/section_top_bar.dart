import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/functions/app_router.dart';

class SectionTopBarWhisList extends StatelessWidget {
  const SectionTopBarWhisList({
    super.key,
    required this.ScreenWidht,
  });

  final double ScreenWidht;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30,bottom: 20),
      child: Row(
        children: [

          InkWell(
            onTap: (){
              context.go(AppRouter.khome);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Icon(Icons.arrow_back_ios_new_outlined,
                color: Color(0xff484C52),),

            ),),
          SizedBox(width: ScreenWidht*.31,),
          Text('wishlist',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Urbanist',
                fontSize: 20.sp,
                fontWeight: FontWeight.w600
            ),
          ),

        ],
      ),
    );
  }
}
