import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_mart/const.dart';

import 'custom_app_bar.dart';

class AddPhoneNumViewBody extends StatelessWidget {
  const AddPhoneNumViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight= MediaQuery.of(context).size.height;
    double screenWidth= MediaQuery.of(context).size.width;
    return SafeArea(child:

    Padding(
      padding:  EdgeInsets.symmetric(horizontal:screenHeight*.04 ),
      child: Column(children: [

        customAppBar(screenHeight: screenHeight),


      ],),
    ));
  }
}

