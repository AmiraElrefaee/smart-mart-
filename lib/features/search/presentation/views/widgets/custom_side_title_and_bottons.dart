import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../const.dart';

class CustomSideTitleAndBotton extends StatelessWidget {
  const CustomSideTitleAndBotton({
    super.key, required this.title, required this.botton, this.onTap,

  });
  final String title;
  final String botton;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title,
          style: TextStyle(
              fontFamily: 'Urbanist',
              fontSize: 16,
              fontWeight: FontWeight.w500
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 10,
          ),
          child: InkWell(onTap: onTap,
              child: Text(botton,
                style: TextStyle(
                    fontFamily: 'Urbanist',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: kColor
                ),
              )),
        ),
      ],

    );
  }
}
