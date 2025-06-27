import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../const.dart';
import '../../../../../core/utils/styles.dart';

class SectionGoogleBotton extends StatelessWidget {
  const SectionGoogleBotton({super.key, required this.screenHeight, required this.screenWidth
    ,required this.onTap,});
  final double screenHeight;
  final double screenWidth;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Container(
          alignment: Alignment.center,
          height:MediaQuery.of(context).size.height * .055,

          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 1
            ),
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:  EdgeInsets.only(right:MediaQuery.of(context).size.width*.03 ),
                child: SvgPicture.asset('assets/images/devicon_google (1).svg',
                width: MediaQuery.of(context).size.width*.06,
                ),
              ),
              Text('Continue with google', style:
              Styles.Urbanist20.copyWith(
                fontWeight: FontWeight.w600,
                  fontSize: MediaQuery.of(context).size.height*.018,
              ),),
            ],
          )),
    );
  }
}
