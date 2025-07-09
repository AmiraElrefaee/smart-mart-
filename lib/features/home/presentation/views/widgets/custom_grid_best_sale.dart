import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_mart/core/domain/entities/item_model.dart';
import 'package:smart_mart/features/home/presentation/views/widgets/section_best_sale.dart';

import '../../../../../const.dart';
import '../../managers/fetch_product_cubit/fetch_product_cubit.dart';
import 'Custom_show_discount_item.dart';

class CustomGridBestSale extends StatelessWidget {
  const CustomGridBestSale({
    super.key,
    // required this.widget,
    required this.ViewAll, required this.screenWidth, required this.scroll, required this.product,
  });

  // final SectionBestSale widget;
  final double screenWidth;
  final bool ViewAll;
  final bool scroll;
  final List<ItemModel> product;

  @override
  Widget build(BuildContext context) {

        return GridView.builder(
            shrinkWrap: true,
            // لجعل GridView تتكيف مع المحتوى
            physics:
            scroll == true
                ? BouncingScrollPhysics()
                : NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // عدد العناصر في الصف
              crossAxisSpacing: 10, // المسافة بين العناصر أفقيًا
              mainAxisSpacing: 10,
              mainAxisExtent: screenWidth * .58,
            ),
            itemCount: ViewAll ? product.length : 4,
            itemBuilder: (context, snapshot) {
              return CustomShowDiscountItem(
                screenWidth: screenWidth,
                product: product[snapshot],
                width: 159.w,
                hight: 201.h,
                widhDiscount: 60.w,
              );
            }
        );



  }
}

