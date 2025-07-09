import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../const.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../category/data/models/sub_category_model.dart';
import '../../../data/models/category_items.dart';
import 'Custom_show_item.dart';
import 'custom_botton_category_food.dart';

class SectionFreshFood extends StatefulWidget {
  const SectionFreshFood({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  State<SectionFreshFood> createState() => _SectionFreshFoodState();
}

class _SectionFreshFoodState extends State<SectionFreshFood> {
  String? selectedCategory; // العنصر المختار

  final List<CategoryItem> items = [
    CategoryItem('Milk', 'assets/items/image 49.png'),
    CategoryItem('Cheese & Labneh', 'assets/items/image (3).png'),
    CategoryItem('Cold cuts', 'assets/items/image (2).png'),
    CategoryItem('Yoghurt', 'assets/items/image (4).png'),

    CategoryItem('Meat', 'assets/items/image (5).png'),
    CategoryItem('More', 'assets/icons/more.png'),
  ];


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.screenWidth,
      height: widget.screenWidth*1.5,
      child: Stack(
        // fit : StackFit.passthrough,
        children: [
          Positioned.fill(
            top: 0,
            left: 0,
            right: 0,
            bottom:widget.screenWidth*.23,
            child: SvgPicture.asset('assets/back_grounds/Group 35.svg',
              fit: BoxFit.cover,
              width: widget.screenWidth,
              // height: 50,
            ),
          ),
          Positioned(
            top: widget.screenWidth*.22,
            left: widget.screenWidth*.24,
            child: Text('FRESH',
              style: Styles.Urbanist32.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 35,
                  color: Colors.white
              ),),
          ),
          Positioned(
            top: widget.screenWidth*.32,
            left: widget.screenWidth*.35,
            child: Text(' FOOD',
              style: Styles.Urbanist32.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 35,
                  color: Colors.white
              ),),
          ),

          Positioned(
              top: widget.screenWidth*.19,
              left: widget.screenWidth*.58,
              child: SvgPicture.asset('assets/back_grounds/Group 38.svg',
                height: widget.screenWidth*.2,
              )),
          Padding(
            padding: EdgeInsets.only(top: widget.screenWidth * .47, left: 10, right: 10),
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              alignment: WrapAlignment.start,
              children: items.map((item) {
                final isSelected = selectedCategory == item.label;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = isSelected ? null : item.label;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: widget.screenWidth * 0.02, vertical: widget.screenWidth * 0.015),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: isSelected ? kColor : Colors.transparent,
                        // width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        item.isSvg
                            ? SvgPicture.asset(item.imagePath, height: widget.screenWidth * 0.07)
                            : Image.asset(item.imagePath, height: widget.screenWidth * 0.068),
                        const SizedBox(width: 5),
                        Text(
                          item.label,
                          style: TextStyle(
                            fontSize:widget.screenWidth * 0.035 ,
                            fontWeight: FontWeight.w600,
                            color: isSelected ? Colors.red : Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          // Positioned(
          //     top: widget.screenWidth*.44,
          //     // left: screenWidth*.05,
          //     child:
          //     Padding(
          //       padding: const EdgeInsets.only(right: 10,
          //       left: 8
          //       ),
          //       child: Row(
          //
          //         children: [
          //           CustomBottomCategoryFood(screenWidth: widget.screenWidth
          //             , Photo: 'assets/items/image 49.png',
          //             text: ' Milk',
          //             color: kColor,
          //
          //           ),
          //           CustomBottomCategoryFood(screenWidth: widget.screenWidth
          //             , Photo: 'assets/items/image (3).png',
          //             text: ' Cheese & Labneh',
          //             color: Colors.black,
          //
          //           ),
          //           CustomBottomCategoryFood(screenWidth: widget.screenWidth
          //             , Photo: 'assets/items/image (2).png',
          //             text: ' Cold cuts',
          //             color: Colors.black,
          //
          //           ),
          //
          //
          //         ],
          //       ),
          //     )
          // ),
          //
          //
          // Positioned(
          //     top: widget.screenWidth*.57,
          //     // left: screenWidth*.05,
          //     child:
          //     Padding(
          //       padding: const EdgeInsets.only(left: 8),
          //       child: Row(
          //
          //         children: [
          //           CustomBottomCategoryFood(screenWidth: widget.screenWidth
          //             , Photo: 'assets/items/image (4).png',
          //             text: ' Yoghurt',
          //             color: Colors.black,
          //
          //           ),
          //           CustomBottomCategoryFood(screenWidth: widget.screenWidth
          //             , Photo: 'assets/items/image (5).png',
          //             text: ' Meat',
          //             color: Colors.black,
          //
          //           ),
          //           CustomBottomMore(screenWidth: widget.screenWidth)
          //
          //
          //
          //         ],
          //       ),
          //     )
          // ),


          Positioned(
            top: widget.screenWidth*.75,
            left: widget.screenWidth*.09,
            child: Text('Best Products',
              style: Styles.Urbanist20.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                  color: Colors.white

              ),),
          ),

          Positioned.fill(
            top: widget.screenWidth*.9,
            child: SizedBox(
              // height: screenWidth*.4,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context,index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: CustomShowItem(screenWidth: widget.screenWidth,
                       item: BestSeller(
                         state: 'available',
                        id: '1',
                        title: 'Sample Item',
                        price: 100.0,
                        brand: 'Sample Brand',
                        description: 'Sample Description',
                        highlights: 'Sample Highlights',
                        barcode: '123456789',
                        stock: 10,
                        itemWeight: '500g',
                        subCategoryId: 'sub1',
                        categoryId: 'cat1',
                        sold: 50,
                        image: 'sample_image_url',
                        rating: 4.5,
                        discount: 10,
                        createdAt: '2025-04-26',
                         subCategoryName: ''
                      ),
                      ),
                    );
                  }
              ),
            ),
          ),
        ],
      ),
    );
  }
}
