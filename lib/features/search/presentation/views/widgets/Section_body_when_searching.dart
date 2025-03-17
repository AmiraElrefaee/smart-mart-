
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_mart/const.dart';

class SectionBodyWhenSearching extends StatelessWidget {
  const SectionBodyWhenSearching({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       Padding(
         padding: const EdgeInsets.only(right: 20),
         child: Row(

           children: [
             SvgPicture.asset('assets/icons/icon-park-outline_search.svg'),
             Padding(
               padding: const EdgeInsets.only(left: 10),
               child: Text(' bread',
               style: TextStyle(
                 fontFamily: 'Urbanist',
                 fontWeight: FontWeight.w700,
                 fontSize: 17,
                 color: kcolor4
               ),
               ),
             ),
             Spacer(),
             Icon(Icons.arrow_forward,
             size: 30,
             )

             ,],
         ),
       )
      ],
    );
  }
}
