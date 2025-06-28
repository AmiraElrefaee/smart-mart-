import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../features/whishList/presentation/managers/whish_list_cubit/whish_list_cubit.dart';

class customLoveBotton extends StatelessWidget {
  const customLoveBotton({
    super.key,
    required this.screenWidth,
    required this.itemId,
    required this.width,
    required this.hight,
    required this.isLoved,
    this.onTap

  });

  final double screenWidth;
final double width;
final double hight;
  final String itemId;
  final bool isLoved;
 final  VoidCallback ?onTap;


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WhishListCubit, WhishListState>(
      builder: (context, state) {
        // final isLoved = context.read<WhishListCubit>().isInWishlist(itemId);
        return Padding(
          padding: EdgeInsets.only(left: screenWidth * .03),
          child: InkWell(onTap:onTap!=null?onTap: () {
            // setState(() {
            //   love=!love;
            // });
            if (isLoved) {
              context.read<WhishListCubit>().removeFromWhishList(
                  idItem: itemId);
            } else {
              context.read<WhishListCubit>().addToWhishList(idItem: itemId);
            }
          }
            ,
            child: isLoved
                ? SvgPicture.asset(
                'assets/icons/heart.svg', height:hight,width: width,)
                : SvgPicture.asset(
                'assets/icons/Vector (4).svg', height:hight,width: width,),

          ),
        );
      },
    );
  }
}

