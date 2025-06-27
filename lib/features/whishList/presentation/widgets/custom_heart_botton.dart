import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../managers/whish_list_cubit/whish_list_cubit.dart';


class CustomHeartBotton extends StatelessWidget {
  const CustomHeartBotton({
    super.key,
    required this.screenWidth,
    required this.itemId, required this.width, required this.hight,
    // required this.isLoved,
  });

  final double screenWidth;
  final double width;
  final double hight;
  final String itemId;
  // final bool isLoved;


  @override
  Widget build(BuildContext context) {

    final isLovedd = context.watch<WhishListCubit>().isInWishlist(itemId);

    return Padding(
          padding: EdgeInsets.only(left: screenWidth * .03),
          child: InkWell(onTap: () {
            // setState(() {
            //   love=!love;
            // });
            if (isLovedd) {
              context.read<WhishListCubit>().removeFromWhishList(
                  idItem: itemId);
            } else {
              context.read<WhishListCubit>().addToWhishList(idItem: itemId);
            }
          }
            ,
            child: AnimatedSwitcher( // 🎯 هنا السحر
              duration: Duration(milliseconds: 300),
              switchInCurve: Curves.easeIn,
              switchOutCurve: Curves.easeOut,
              transitionBuilder: (child, animation) {
                return FadeTransition(opacity: animation, child: child);
              },

            child: isLovedd
                ? SvgPicture.asset(
              'assets/icons/heart.svg', height:hight,width: width,
              key: ValueKey('filled-${itemId}'),
            )
                : SvgPicture.asset(
              'assets/icons/Vector (4).svg', height:hight,width: width,
              key: ValueKey('empty-${itemId}'),
            ),

          ),

        ));

  }
}

