import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_mart/features/category/data/models/sub_category_model.dart';

import '../../../../home/presentation/views/widgets/Custom_show_discount_item.dart';
import '../../../../home/presentation/views/widgets/Custom_show_item.dart';

class SectionBestSaleCategory extends StatelessWidget {
  const SectionBestSaleCategory({
    super.key,
    required this.screenWidth, required this.bestSale,
  });

  final double screenWidth;
  final List <BestSeller> bestSale;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: Text('Best Sale',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600
            ),),
        ),
        SizedBox(
          height: 20,
        ),

        SizedBox(
          height: screenWidth*.6,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: bestSale.length ,
              itemBuilder: (context,index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: CustomShowDiscountItem(
                    screenWidth: screenWidth,
                    product:bestSale[index] ,
                    width: 167.w,
                    hight: 215.h,
                    widhDiscount: 68.w,
                  )

                  // CustomShowItem(screenWidth: screenWidth,
                  //   item: bestSale[index]
                  // ),
                );
              }
          ),
        ),
        SizedBox(
          height: 20,
        ),
        // Text('Best in Baby Diapers',
        //   style: TextStyle(
        //       fontSize: 22,
        //       fontWeight: FontWeight.w600
        //   ),),
        // SizedBox(
        //   height: 20,
        // ),
        // SizedBox(
        //   height: screenWidth*.6,
        //   child: ListView.builder(
        //       scrollDirection: Axis.horizontal,
        //       itemCount: 5,
        //       itemBuilder: (context,index) {
        //         return Padding(
        //           padding: const EdgeInsets.only(left: 15),
        //           child: CustomShowItem(screenWidth: screenWidth),
        //         );
        //       }
        //   ),
        // ),
        SizedBox(height: 100,)

      ],
    );
  }
}

