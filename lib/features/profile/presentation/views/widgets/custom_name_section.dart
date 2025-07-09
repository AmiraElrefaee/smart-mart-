import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomNameSection extends StatelessWidget {
  const CustomNameSection({
    super.key, required this.name,
  });
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.center,
      width: 321.w,
      height: 43.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xffF8F8F8)
      ),
      child:Text(name,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Urbanist'
        ),
      ) ,);
  }
}


