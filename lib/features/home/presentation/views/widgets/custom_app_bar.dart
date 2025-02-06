import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../const.dart';
import '../../../../../core/utils/styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: (){},
          child: SvgPicture.asset('assets/icons/Vector (1).svg',
            width:screenWidth*.05 ,
          ),
        ),
        Spacer(),
        Column(

          children: [
            Row(children: [
              Text('Hi ',
                  style: Styles.NexaBold20
              ),
              Text('Amira ,',
                style: Styles.NexaBold20.copyWith(
                    color: kColor
                ),
              )
            ],
            ),
            Text('start your joureny now',
              style: Styles.NexaBold14.copyWith(
                  color: kcolor3
              ),
            )

          ],),
        Spacer(),
        InkWell(
          onTap: (){},
          child: SvgPicture.asset('assets/icons/shape.svg',
            width:screenWidth*.05 ,
          ),
        ),
      ],
    );
  }
}
