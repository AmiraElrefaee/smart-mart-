import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_mart/features/category/presentation/views/widgets/section_define_category.dart';
import 'package:smart_mart/features/category/presentation/views/widgets/section_photo_category.dart';

import '../../../../../const.dart';
import '../../../../home/presentation/views/widgets/custom_side_title.dart';
import 'custom_top_bar.dart';

class ItemCategoryPageViewBody extends StatelessWidget {
  const ItemCategoryPageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final  List<Map<String, String>> DetailCategory=[
      {'title':'Baby Diapers',
        'photo':'assets/category/image 55.png'
      },
      {'title':'Wipes & creams',
        'photo':'assets/category/image56.png'
      },
      {'title':'Baby Milk',
        'photo':'assets/category/Baby_Milk_734678aa30.png'
      },
      {'title':'Baby Food',
        'photo':'assets/category/Baby_Food_6c7ceb03ef 1.png'
      }
    ];
    final title = GoRouterState.of(context).extra as String? ?? 'Default Title';

    double  screenWidth= MediaQuery.of(context).size.width;
    return Column(
      children: [

        customTopBar(
          screenWidth: MediaQuery.of(context).size.width,
        ),
        sectionDefineCategory(screenWidth: screenWidth, title: title),
        SectionPhotoCategory(screenWidth: screenWidth),
        SectionListDetailsCategory(screenWidth: screenWidth,
            DetailCategoryTop: DetailCategory,
        DetailCategoryBottom:DetailCategory ,
        ),
        // SectionListDetailsCategory(screenWidth: screenWidth,
        //     DetailCategoryTop: DetailCategory),

        Padding(
          padding:  EdgeInsets.only(left: screenWidth*.04),
          child: Column(children: [
            Text('')

          ],),


        ),


      ],
    );
  }
}

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
          SizedBox(height: 5), // المسافة بين القائمتين
          _buildCategoryList(widget.DetailCategoryBottom,
              selectedIndexBottom, _onBottomItemTapped),
        ],
      ),
    );
  }

  Widget _buildCategoryList(List<Map<String, String>> categoryList, int? selectedIndex, Function(int) onTap) {
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
