import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      margin: EdgeInsets.only(top: 80),
      child: FloatingActionButton(

        onPressed: (){},
        backgroundColor: kColor,
        shape:   CircleBorder(
            eccentricity: .1
        ),
        child:const Icon( Icons.qr_code_scanner_outlined,

          color: Colors.white,
          size: 50,
        ),),
    );
  }
}

