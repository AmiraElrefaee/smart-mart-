import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../const.dart';
import '../../../../home/presentation/managers/fetch_product_cubit/fetch_product_cubit.dart';
import '../../../../home/presentation/views/widgets/Custom_show_discount_item.dart';

class SectionPickUpForYou extends StatelessWidget {
  const SectionPickUpForYou({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 201.h,
      child: BlocBuilder<FetchProductCubit, FetchProductState>(
        builder: (context, state) {
          if (state is FetchProductLoading){
            return Center(child: CircularProgressIndicator(color: kColor,));
          } else if (state is FetchProductSucces){
            return ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: CustomShowDiscountItem(
                        screenWidth: screenWidth,
                        product: state.products[index],
                        width: 159.w,
                        hight: 201.h,
                        widhDiscount: 60.w,

                      )
                  );
                }
            );}
          else {
            return Text('thers is no product for you ');
          }

        },
      ),
    );
  }
}
