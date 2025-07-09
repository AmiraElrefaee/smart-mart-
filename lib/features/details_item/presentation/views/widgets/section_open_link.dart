import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../const.dart';

class SectionOpenLink extends StatelessWidget {
  const SectionOpenLink({super.key, required this.brand});
  final String brand;
  @override
  Widget build(BuildContext context) {
    return      Row(children: [
      Text('More from',
  style: TextStyle(
  fontSize: 14.sp,
  fontWeight: FontWeight.w500,
  color: Color(0xff484C52)
  ),
  ),
  TextButton(onPressed: (){}
  , child: Text(brand,
  style: TextStyle(
  color: kColor,
  decoration: TextDecoration.underline,
  decorationColor: kColor,
  fontWeight: FontWeight.w500,
  // خط تحت النص
  fontSize: 14.sp,
  ),
  )),

  ],);
  }
}
