import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../const.dart';
import '../../../../../utils/styles.dart';

class CustomBotton extends StatelessWidget {
  const CustomBotton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height * .06,
        margin: EdgeInsets.all(MediaQuery.of(context).size.height * .03),
        decoration: BoxDecoration(
            color: kColor,
            borderRadius: BorderRadius.circular(10)
        ),
        child: InkWell(
            onTap: () {},
            child: Text('Next', style:
            Styles.NexaBold24.copyWith(color: Colors.white),)));
  }
}
