import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_mart/features/category/presentation/views/widgets/section_best_sale_category.dart';
import 'package:smart_mart/features/category/presentation/views/widgets/section_bottons.dart';

import '../../../../../const.dart';
import '../../../../home/presentation/views/widgets/custom_grid_best_sale.dart';

class SectionListDetailsCategory extends StatefulWidget {
  const SectionListDetailsCategory({
    super.key,
    required this.screenWidth,
    required this.DetailCategoryTop,
    required this.DetailCategoryBottom,
  });

  final double screenWidth;
  final List<Map<String, String>> DetailCategoryTop;
  final List<Map<String, String>> DetailCategoryBottom;

  @override
  State<SectionListDetailsCategory> createState() => _SectionListDetailsCategoryState();
}

class _SectionListDetailsCategoryState extends State<SectionListDetailsCategory> {
  int? selectedIndexTop;
  int? selectedIndexBottom;

  void _onTopItemTapped(int index) {
    setState(() {
      selectedIndexTop = (selectedIndexTop == index) ? null : index;
      selectedIndexBottom = null; // إلغاء تحديد العنصر في القائمة الثانية
    });
  }

  void _onBottomItemTapped(int index) {
    setState(() {
      selectedIndexBottom = (selectedIndexBottom == index) ? null : index;
      selectedIndexTop = null; // إلغاء تحديد العنصر في القائمة الأولى
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCategoryList(widget.DetailCategoryTop,
              selectedIndexTop, _onTopItemTapped),

          SizedBox(height: 5),
          // المسافة بين القائمتين
          _buildCategoryList(widget.DetailCategoryBottom,
              selectedIndexBottom, _onBottomItemTapped),

          Builder(
            builder: (context) {
              if(selectedIndexBottom== null&& selectedIndexTop==null)
           {   return SectionBestSaleCategory
                (screenWidth: widget.screenWidth,
              );}

              else{
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
          )
        ],
      ),
    );
  }

  Widget _buildCategoryList(List<Map<String, String>> categoryList,
      int? selectedIndex, Function(int) onTap) {
    return SizedBox(
      width: widget.screenWidth,
      height: widget.screenWidth * .17,
      child: ListView.builder(
        itemCount: categoryList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          bool selectedItem = selectedIndex == index;
          return InkWell(
            onTap: () => onTap(index),
            child: Container(

              margin: EdgeInsets.only(left: 12, top: 6),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Color(0xffF8F8F8),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 1,
                  color: selectedItem ? kColor : Color(0xffF8F8F8),
                ),
              ),
              child: Row(
                children: [
                  Image.asset(
                    categoryList[index]['photo']!,
                    height: widget.screenWidth * .12,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(width: 10),
                  Text(
                    categoryList[index]['title']!,
                    style: TextStyle(
                      color: selectedItem ? kColor : kcolor4,
                      fontSize: 15,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}


