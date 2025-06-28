import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_mart/const.dart';

import '../../../../category/data/models/sub_category_model.dart';
import '../../managers/fetch_product_cubit/fetch_product_cubit.dart';
import 'Custom_show_discount_item.dart';
import 'Custom_show_item.dart';

class SectonShowItemLisView extends StatelessWidget {
  const SectonShowItemLisView({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth,
      height: screenWidth * 1.1,
      child: Stack(
        // fit : StackFit.passthrough,
        //assets/back_grounds/Group 38.svg
        children: [
          Positioned.fill(
            top: 0,
            left: 0,
            right: 0,
            bottom: screenWidth * .17,
            child: SvgPicture.asset('assets/back_grounds/Group 39.svg',
              fit: BoxFit.fitWidth,
              width: screenWidth,
              height: 50,
            ),
          ),
          Positioned(
              top: screenWidth * .26
              ,
              left: screenWidth * .34,
              child: SvgPicture.asset('assets/icons/Frame 1984078145 (1).svg',
                height: screenWidth * .13,
              )),
          Positioned(
              top: screenWidth * .12
              ,
              left: 0,
              child: SvgPicture.asset('assets/back_grounds/Group 18.svg',
                height: screenWidth * .25,
              )),
          Positioned(
              top: screenWidth * .1
              ,
              right: 0,
              child: SvgPicture.asset('assets/back_grounds/Group 17.svg',
                height: screenWidth * .25,
              )),
          Positioned.fill(
            top: screenWidth * 0.47,
            child: BlocBuilder<FetchProductCubit, FetchProductState>(
              builder: (context, state) {
                if (state is FetchProductSucces) {
                  return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.products.length,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    separatorBuilder: (context, index) => const SizedBox(width: 10),
                    itemBuilder: (context, index) {
                      final item = state.products[index];
                      return CustomShowDiscountItem(
                        screenWidth: screenWidth,
                        product: item,
                        width: 160.w,
                        hight: 201.h,
                      );
                    },
                  );
                } else if (state is FetchProductLoading) {
                  return const Center(
                    child: CircularProgressIndicator(color: kColor),
                  );
                } else {
                  return const Center(child: Text('There are no items'));
                }
              },
            ),
          ),


          // Positioned.fill(
          //   top: screenWidth*.47,
          //   child: SizedBox(
          //     // height: screenWidth*.35,
          //     child: ListView.builder(
          //         scrollDirection: Axis.horizontal,
          //         itemCount: 5,
          //         itemBuilder: (context,index) {
          //           return Padding(
          //             padding: const EdgeInsets.only(left: 15),
          //             child: CustomShowItem(
          //               screenWidth: screenWidth,
          //               item: BestSeller(
          //                 id: '1',
          //                 title: 'Sample Item',
          //                 price: 100.0,
          //                 brand: 'Sample Brand',
          //                 description: 'Sample Description',
          //                 highlights: 'Sample Highlights',
          //                 barcode: '123456789',
          //                 stock: 10,
          //                 itemWeight: '500g',
          //                 subCategoryId: 'sub1',
          //                 categoryId: 'cat1',
          //                 sold: 50,
          //                 image: 'sample_image_url',
          //                 rating: 4.5,
          //                 discount: 10,
          //                 createdAt: '2025-04-26',
          //               ),
          //             ),
          //           );
          //         }
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

