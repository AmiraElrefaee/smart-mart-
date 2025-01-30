import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../const.dart';

class CustomTextBottom extends StatelessWidget {
  const CustomTextBottom({
    super.key, required this.text, this.onTap,
  });
final String text;
 final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style:  TextStyle(fontSize: MediaQuery.of(context).size.height*.017,
            fontWeight: FontWeight.w400,
            color: kColor
        ),
      ),
    );
  }
}
