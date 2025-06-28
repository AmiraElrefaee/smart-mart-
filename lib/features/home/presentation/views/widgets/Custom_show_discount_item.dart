import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_mart/core/domain/entities/item_model.dart';

import '../../../../../const.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_love_botton.dart';
import '../../../../whishList/presentation/managers/whish_list_cubit/whish_list_cubit.dart';
import 'custom_price.dart';

class CustomShowDiscountItem extends StatelessWidget {
  const CustomShowDiscountItem({
    super.key,
    required this.screenWidth, required this.product, required this.width, required this.hight,
  });

  final double screenWidth;
final ItemModel product;
final double width ;
final double hight;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width:width,
          height:hight ,
          padding: EdgeInsets.only(top:screenWidth*.04,
          // bottom:screenWidth*.01,
            right: 5.w,
            left: 5.w
          ),

          decoration: BoxDecoration(

            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(

              color: Color(0xffD9D9D9), // لون الحدود
              width: 1, // سمك الحدود
            ),
          ),
          child: Column(children: [

            // Image.asset('assets/items/image (1).png',
            //   height: 119.h,
            //   width: 95.w,
            // ),
            SizedBox(
              height: 97.h,
              // width: screenWidth*.3,

              child: CachedNetworkImage(
                imageUrl:product.image,
                fit: BoxFit.fill,
                placeholder: (context, url) => Container(
                  color: Colors.grey.shade300,
                  child: const Center(child: CircularProgressIndicator(
                    color: kColor,

                  )),
                ),
                errorWidget: (context, url, error) => Container(
                  color: Colors.grey.shade300,
                  child: const Center(child: Icon(Icons.error,
                    color: kColor,
                  )),
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top: screenWidth*.01),
              child: Text('${product.title}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Styles.NexaBold14.copyWith(
                    fontWeight: FontWeight.w500,
                  fontSize: 13.sp
                ),

              ),
            ),

            SizedBox(
              height: 10,
            ),
            Container(
              width: 140, // عرض الخط
              height: 1, // طول الخط
              color: Color(0xffDADADA), // لون الخط
            ),
            SizedBox(
              height: 5,
            ),

            // Row(
            //   // mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.only(left: 20,
            //       right: 25
            //       ),
            //       child: Row(
            //         // mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //         Text('${product.price.toInt()}',
            //           style: Styles.Urbanist25.copyWith(
            //             color: kColor,
            //             fontWeight: FontWeight.w700,
            //             fontSize: 24.sp
            //           ),
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.only(right: .0),
            //           child: Column(children: [
            //             Text('.00 ',
            //               style: Styles.Urbanist16.copyWith(
            //                 fontSize: 12.sp,
            //                 color: kColor,
            //                 fontWeight: FontWeight.w500,
            //               ),
            //             ),
            //             Text(' EGP ',
            //               style: Styles.Urbanist16.copyWith(
            //                 fontSize: 10.sp,
            //               ),
            //             )
            //           ],),
            //         ),
            //       ],),
            //     ),
            //
            //
            //
            //
            //     Container(
            //       width: 1, // عرض الخط
            //       height: 30, // طول الخط
            //       color:const Color(0xffDADADA), // لون الخط
            //     ),
            //     customLoveBotton(
            //       screenWidth: screenWidth,
            //       itemId: product.id,
            //       width: 17.w,
            //       hight: 15.h,
            //       isLoved: context.watch<WhishListCubit>().isInWishlist(product.id),
            //
            //     ),
            //   ],),

            CustomPrice(screenWidth: screenWidth,
              price: product.price,
              itemId: product.id,
            ),
          ],),
        ),


          Positioned(
            top: screenWidth*.06,
            left: screenWidth*.25,
            child: Container(
              width: 60.w,
              height: 22.h,
              decoration: BoxDecoration(
                color: product.discount!=0?Color(0xff72FC97):Colors.transparent,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10)
                )
              ),
              child: Padding(
                padding:  EdgeInsets.only(top: 2.h,
                left: 10.w
                ),
                child: product.discount!=0?Text('${product.discount}% off',
                style: Styles.Urbanist13.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff484C52)
                ),
                ) :Text(''),
              ),
            ),
          ),

      ],
    );
  }
}

