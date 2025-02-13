import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../const.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(

      width: 80,
      height: 80,
      margin: const EdgeInsets.only(top: 80),
      child: FloatingActionButton(

        onPressed: (){},
        backgroundColor: kColor,
        shape:   CircleBorder(
            eccentricity: .1
        ),
        child: SvgPicture.asset(
          'assets/icons/Vector (8).svg',
        height: MediaQuery.of(context).size.width*.1,
        ),),
    );
  }
}

