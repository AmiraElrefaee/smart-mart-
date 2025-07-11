import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class sectionPaymentSummary extends StatelessWidget {
  const sectionPaymentSummary({
    super.key, required this.title1, required this.title2,
  });
  final String title1 ;
  final String title2;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title1,
            style: TextStyle(
                fontFamily: 'Urbanist',
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xff484C52)
            ),
          ),

          Text(title2,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontFamily: 'Urbanist',
              fontSize: 16.sp,

            ),
          )
        ],
      ),
    );
  }
}
