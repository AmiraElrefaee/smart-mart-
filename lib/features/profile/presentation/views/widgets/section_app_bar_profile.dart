import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SecttionAppBarProfile extends StatelessWidget {
  const SecttionAppBarProfile({
    super.key, required this.title,
  });
final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: (){
            context.pop();
          },
          child:const  Icon(Icons.arrow_back_ios_new_outlined,
            color: Color(0xff484C52),
          ),
        ),
        Spacer(),
        Text(title,
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
