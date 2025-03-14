import 'package:flutter/cupertino.dart';

class CustomSideTitlePayemtMethod extends StatelessWidget {
  const CustomSideTitlePayemtMethod({
    super.key, required this.title,
  });

  final String title;
  @override
  Widget build(BuildContext context) {
    return   Text(title,

        style: TextStyle(
            fontFamily: 'Urbanist',
            fontSize: 20,
            fontWeight: FontWeight.w500,

            color: Color(0xff484C52)

        ));
  }
}
