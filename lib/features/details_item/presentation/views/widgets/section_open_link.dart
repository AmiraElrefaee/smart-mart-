import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../const.dart';

class SectionOpenLink extends StatelessWidget {
  const SectionOpenLink({super.key});
  Future<void> _launchURL() async {
    final Uri uri = Uri.parse("https://www.carrefouregypt.com/mafegy/en/c/50164");

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      print("هنا مشكلة: لا يمكن فتح الرابط");
      throw "لا يمكن فتح الرابط: $uri";
    } else {
      print("الرابط يعمل بنجاح");
    }
  }
  @override
  Widget build(BuildContext context) {
    return      Row(children: [
      Text('More from',
  style: TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w500,
  color: Color(0xff484C52)
  ),
  ),
  TextButton(onPressed: _launchURL
  , child: Text('El Doha',
  style: TextStyle(
  color: kColor,
  decoration: TextDecoration.underline,
  decorationColor: kColor,
  fontWeight: FontWeight.w500,
  // خط تحت النص
  fontSize: 18,
  ),
  )),

  ],);
  }
}
