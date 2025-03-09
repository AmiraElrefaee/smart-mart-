import 'package:flutter/cupertino.dart';
import 'package:smart_mart/features/home/presentation/views/widgets/section_best_sale.dart';

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
    return GridView.builder(
        shrinkWrap: true, // لجعل GridView تتكيف مع المحتوى
        physics:
        scroll==true?BouncingScrollPhysics(): NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // عدد العناصر في الصف
          crossAxisSpacing: 10, // المسافة بين العناصر أفقيًا
          mainAxisSpacing:10,
          mainAxisExtent: screenWidth*.58 ,
        ),
        itemCount: ViewAll?60:4,
        itemBuilder: (context, snapshot) {
          return CustomShowDiscountItem(
            screenWidth: screenWidth,
          );
        }
    );
  }
}

