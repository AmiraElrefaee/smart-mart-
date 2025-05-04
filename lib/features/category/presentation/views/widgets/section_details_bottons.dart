import 'package:flutter/cupertino.dart';
import 'package:smart_mart/features/category/presentation/views/widgets/section_bottons.dart';
import 'package:smart_mart/features/category/presentation/views/widgets/section_list_details_category.dart';

import '../../../../home/presentation/views/widgets/custom_grid_best_sale.dart';

class SectionDetailsBottons extends StatelessWidget {
  const SectionDetailsBottons({
    super.key,
    required this.selectedIndexBottom,
    required this.widget,
    required this.selectedIndexTop,
  });

  final int? selectedIndexBottom;

  final SectionListDetailsCategory widget;
  final int? selectedIndexTop;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,
          vertical: 20
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          selectedIndexBottom== null?
          Text(widget.DetailCategoryTop[selectedIndexTop!]['title']!,
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600
            ),

          )
              :Text(widget.DetailCategoryBottom[selectedIndexBottom!]['title']!,
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600
            ),
          ),
          SectionBottons(),
          SizedBox(height: 20,),
          CustomGridBestSale(
            ViewAll: true,
            screenWidth: widget.screenWidth,
            scroll: false,
          ),

          SizedBox(height: 100,)



        ],),
    );
  }
}


