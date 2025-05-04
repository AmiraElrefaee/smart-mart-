import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_mart/features/category/presentation/managers/Sub_category_cubit/sub_category_cubit.dart';
import 'package:smart_mart/features/category/presentation/views/widgets/section_best_sale_category.dart';
import 'package:smart_mart/features/category/presentation/views/widgets/section_bottons.dart';
import 'package:smart_mart/features/category/presentation/views/widgets/section_details_bottons.dart';

import '../../../../../const.dart';
import '../../../../home/presentation/views/widgets/custom_grid_best_sale.dart';
import '../../../data/models/sub_category_model.dart';

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
    return BlocConsumer<SubCategoryCubit, SubCategoryState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    if(state is SubCategorySucess ){
      final mid = (state.subCategories.length / 2).ceil();
      final topList = state.subCategories.take(mid).toList();
      final bottomList = state.subCategories.skip(mid).toList(); // الباقي
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCategoryList(topList,
              selectedIndexTop, _onTopItemTapped,
          false
          ),
          SizedBox(height: 5),
          // المسافة بين القائمتين
          _buildCategoryList(bottomList,
              selectedIndexBottom, _onBottomItemTapped,
          true
          ),

          Builder(
            builder: (context) {
              if(selectedIndexBottom== null&& selectedIndexTop==null)
           {

             return SectionBestSaleCategory
                (screenWidth: widget.screenWidth,
               bestSale: state.bestSellers,
             );



           }

              else{
               return SectionDetailsBottons(
                   selectedIndexBottom: selectedIndexBottom,
                   widget: widget,
                   selectedIndexTop: selectedIndexTop);
              }
            }
          )
        ],
      ),
    );
  }
  else {
   return Center(child: Text('laoding'));
    }
  }

);
  }

  Widget _buildCategoryList(List<SubCategoryModel> categoryList,
      int? selectedIndex, Function(int) onTap,
      bool reverse
      ) {
    return SizedBox(
      width: widget.screenWidth,
      height: widget.screenWidth * .17,
      child: ListView.builder(
        reverse: reverse,
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
                  SizedBox(
                    height: widget.screenWidth * .12,
                    child: CachedNetworkImage(
                      imageUrl:categoryList[index].image,
                      fit: BoxFit.fill,
                      placeholder: (context, url) => Container(
                        color: Colors.grey.shade300,
                        child: const Center(child: CircularProgressIndicator()),
                      ),
                      errorWidget: (context, url, error) => Container(
                        color: Colors.grey.shade300,
                        child: const Center(child: Icon(Icons.error)),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    categoryList[index].name,
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

