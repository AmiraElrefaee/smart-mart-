import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../const.dart';

class customAppBar extends StatelessWidget {
  const customAppBar({
    super.key,
    required this.screenHeight,
  });

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical:  screenHeight*.05),
      height: screenHeight*.053,
      width: screenHeight*.053,
      decoration: BoxDecoration(
          border:Border.all(
              width: 1,
              color: Color(0xffDADADA)
          ),
          borderRadius: BorderRadius.circular(14)
      ),
      child: IconButton(onPressed: (){
        GoRouter.of(context).pop();
      },
          icon: Icon(Icons.arrow_back_ios_new_outlined,
            color: kColor,
          )),
    );
  }
}