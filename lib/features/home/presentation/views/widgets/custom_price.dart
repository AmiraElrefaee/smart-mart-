import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../const.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_love_botton.dart';
import '../../../../whishList/presentation/managers/whish_list_cubit/whish_list_cubit.dart';

class CustomPrice extends StatelessWidget {
  const CustomPrice({
    super.key,
    required this.screenWidth, required this.price, required this.itemId,
  });

  final double screenWidth;
  final num price;
  final String itemId;

  @override
  // bool love =false ;

  Widget build(BuildContext context) {

    return BlocBuilder<WhishListCubit, WhishListState>(
      builder: (context, state) {

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$price',
              style: Styles.Urbanist25.copyWith(
                color: kColor,
                fontSize: screenWidth * .055,
                fontWeight: FontWeight.w700,
              ),
            ),

            Column(children: [
              Text('.00',
                style: Styles.Urbanist16.copyWith(
                  fontSize: screenWidth * .03,
                  color: kColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(' EGP',
                style: Styles.Urbanist16.copyWith(
                  fontSize: screenWidth * .03,
                ),
              )
            ],),

            Text('  EGP $price,20  ',
              style: Styles.Urbanist12.copyWith(
                  fontSize: screenWidth * .025,
                  decoration: TextDecoration.lineThrough,
                  color: Color(0xffA5A5A5)
              ),),


            Container(
              width: 1, // عرض الخط
              height: 30, // طول الخط
              color: const Color(0xffDADADA), // لون الخط
            ),

            customLoveBotton(screenWidth: screenWidth, itemId: itemId,
            hight: 15.h,
              width: 17.w,
              isLoved: context.watch<WhishListCubit>().isInWishlist(itemId),

            ),

          ],);
      },
    );
  }
}

