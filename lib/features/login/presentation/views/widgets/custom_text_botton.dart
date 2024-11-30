import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../const.dart';

class CustomTextBottom extends StatelessWidget {
  const CustomTextBottom({
    super.key, required this.text,
  });
final String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Text(
        text,
        style: TextStyle(fontSize: MediaQuery.of(context).size.width*.04,
            fontWeight: FontWeight.w400,
            color: kColor
        ),
      ),
    );
  }
}
