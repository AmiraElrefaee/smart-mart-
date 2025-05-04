import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_mart/core/domain/entities/item_model.dart';
import 'package:smart_mart/features/category/data/models/sub_category_model.dart';

import '../../../../../const.dart';
import '../../../../../core/utils/functions/Navigate_to_page.dart';
import '../../../../../core/utils/functions/app_router.dart';
import '../../../../../core/utils/styles.dart';
import 'custom_price.dart';

class CustomShowItem extends StatelessWidget {
  const CustomShowItem({
    super.key,
    required this.screenWidth,
required this.item

  }

  );

  final double screenWidth;

final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        GoRouter.of(context).push(AppRouter.kdetails,
        extra: item
        );

      },
      child: Container(
        width:screenWidth*.5,
        height:screenWidth*.45 ,
        // screenWidth*.03 ,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(

            color: Color(0xffD9D9D9), // لون الحدود
            width: 1, // سمك الحدود
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child:
            // item.length==0?
            // Image.asset('assets/items/image (1).png',
            // height: screenWidth*.25,
            // )
            SizedBox(
              height: screenWidth*.25,
              // width: screenWidth*.3,

              child: CachedNetworkImage(
                imageUrl:item.image,
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
          ),
          Text(item.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Styles.NexaBold14.copyWith(
                fontWeight: FontWeight.w500
            ),

          ),
          Text(' (${item.itemWeight} gm)',
              style: Styles.NexaBold14.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Color(0xff484C52)
              )),
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

          CustomPrice(screenWidth: screenWidth,
          price: item.price,
          ),
          SizedBox(height: 10,)

        ],),
      ),
    );
  }
}

