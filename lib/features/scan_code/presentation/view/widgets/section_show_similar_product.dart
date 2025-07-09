import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../const.dart';
import '../../../../details_item/presentation/managers/similar_product_cubit/similar_product_cubit.dart';
import '../../../../home/presentation/views/widgets/Custom_show_discount_item.dart';

class SectionShowSimilarProduct extends StatelessWidget {
  const SectionShowSimilarProduct({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarProductCubit, SimilarProductState>(
      builder: (context, state) {
        if(state is SimilarProductSuccess){
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(), // يمنع التمرير الداخلي لو داخل ScrollView خارجي
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:2, // عدد الأعمدة
              crossAxisSpacing: 10.h,
              mainAxisSpacing: 5.h,
              childAspectRatio: 167 / 201, // مهم عشان تحافظي على أبعاد العنصر
            ),
            itemCount: state.product.length,
            itemBuilder: (context, index) {
              print('theeeee legnthhhh ${state.product.length}');
              return CustomShowDiscountItem(
                screenWidth: screenWidth,
                product: state.product[index],
                width: 167.w,
                hight: 201.h,
                widhDiscount: 65.w,
              );
            },
          );}
        else if (state is SimilarProductLoading){
          return Center(child: CircularProgressIndicator(color: kColor,));
        } else{
          return Text(' there is no similar product');
        }

      },
    );
  }
}
