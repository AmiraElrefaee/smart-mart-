import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_mart/utils/functions/app_router.dart';

import '../../../../../const.dart';
import '../../../../../utils/styles.dart';
import '../../../../login/presentation/views/login_view.dart';
import '../../../data/models/content_model.dart';
import '../../../../login/presentation/views/widgets/custom_botton.dart';

class SectionBotton extends StatelessWidget {
   SectionBotton({super.key, required this.currentIndex, required this.onNext});

  final int currentIndex;
   final VoidCallback onNext;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      width: MediaQuery.of(context).size.width,
      top: MediaQuery.of(context).size.height * .79,

      child: InkWell(
        onTap: onNext,
        child: Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height * .06,
            margin: EdgeInsets.all(MediaQuery.of(context).size.height * .03),
            decoration: BoxDecoration(
                color: kColor,
                borderRadius: BorderRadius.circular(10)
            ),
            child:
            Text(currentIndex == contents.length - 1 ? "Get Started" : "Next", style:
            Styles.NexaBold24.copyWith(color: Colors.white),)),
      ),

    );
  }
}
