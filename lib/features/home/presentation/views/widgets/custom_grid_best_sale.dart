import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_mart/features/home/presentation/views/widgets/section_best_sale.dart';

import '../../../../../const.dart';
import '../../managers/fetch_product_cubit/fetch_product_cubit.dart';
import 'Custom_show_discount_item.dart';

class CustomGridBestSale extends StatelessWidget {
  const CustomGridBestSale({
    super.key,
    // required this.widget,
    required this.ViewAll, required this.screenWidth, required this.scroll,
  });

  // final SectionBestSale widget;
  final double screenWidth;
  final bool ViewAll;
  final bool scroll;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FetchProductCubit, FetchProductState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is FetchProductSucces){
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
            itemCount: ViewAll ? state.products.length : 4,
            itemBuilder: (context, snapshot) {
              return CustomShowDiscountItem(
                screenWidth: screenWidth,
                product: state.products[snapshot],
                width: 159.w,
                hight: 201.h,
              );
            }
        );}

        else if (state is FetchProductLoading){
          return CircularProgressIndicator(color: kColor);
        }  else {
          return Text('there is no offers ');
        }
      },
    );
  }
}

