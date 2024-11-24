import 'package:flutter/cupertino.dart';
import 'package:smart_mart/utils/styles.dart';

import '../../../../../const.dart';

class ExplantoryText extends StatelessWidget {
  const ExplantoryText({
    super.key, required this.text1, required this.text2,
  });
  final String text1;
  final String text2;
  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        Text(
          text1,
          style:Styles.Urbanist25.copyWith(color: kColor)
        ),
        Text(
          text2,
          style: Styles.Urbanist25
        ),
      ],
    );
  }
}