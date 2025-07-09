import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecttionAppBarProfile extends StatelessWidget {
  const SecttionAppBarProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(

          child:const  Icon(Icons.arrow_back_ios_new_outlined,
            color: Color(0xff484C52),
          ),
        ),
        Spacer(),
        Text('Account',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.sp,
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.w600,),),
        Spacer(),
      ],
    );
  }
}
