import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../const.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../category/data/models/sub_category_model.dart';
import '../../../data/models/category_items.dart';
import 'Custom_show_item.dart';
import 'custom_show_item_out_of_stock.dart';

class SectionBakeryAndPastry extends StatefulWidget {
  const SectionBakeryAndPastry({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  State<SectionBakeryAndPastry> createState() => _SectionBakeryAndPastryState();
}

class _SectionBakeryAndPastryState extends State<SectionBakeryAndPastry> {
  String? selectedCategory; // العنصر المختار

  final List<CategoryItem> items = [
    CategoryItem('Croissants & Pate', 'assets/items/pngwing.com (24) 1.png'),
    CategoryItem('Bread', 'assets/items/pngwing.com (23) 1.png'),
    CategoryItem('Rice', 'assets/items/pngwing.com (25) 1.png'),
    CategoryItem('Dessert', 'assets/items/pngwing.com (26) 1 (1).png'),
    CategoryItem('Biscuits & crackers', 'assets/items/pngwing.com (27) 1.png'),
    CategoryItem('More', 'assets/icons/more.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.screenWidth,
      height: widget.screenWidth * 1.7,
      child: Stack(
        children: [
          /// الخلفية
          Positioned.fill(
            top: 0,
            left: 0,
            right: 0,
            bottom: widget.screenWidth * .23,
            child: SvgPicture.asset(
              'assets/back_grounds/Group 37.svg',
              fit: BoxFit.fitWidth,
              width: widget.screenWidth,
            ),
          ),

          /// Bakery Title
          Positioned(
            top: widget.screenWidth * .3,
            left: widget.screenWidth * .23,
            child: Text(
              'Bakery',
              style: Styles.Urbanist32.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 35,
                color: Colors.white,
              ),
            ),
          ),

          /// & Pastry Title
          Positioned(
            top: widget.screenWidth * .39,
            left: widget.screenWidth * .29,
            child: Text(
              '& Pastry',
              style: Styles.Urbanist32.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 35,
                color: Colors.white,
              ),
            ),
          ),

          /// عناصر الفئة - باستخدام Wrap بدلاً من Positioned
          Padding(
            padding: EdgeInsets.only(top: widget.screenWidth * .54, left: 10, right: 10),
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
                            ? SvgPicture.asset(item.imagePath,height: widget.screenWidth * 0.03)
                            : Image.asset(item.imagePath, height: widget.screenWidth * 0.065),
                        const SizedBox(width: 5),
                        Text(
                          item.label,
                          style: TextStyle(
                            fontSize:widget.screenWidth * 0.033 ,
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

          /// Best Products Text
          Positioned(
            top: widget.screenWidth * .78,
            left: widget.screenWidth * .09,
            child: Text(
              'Best Products',
              style: Styles.Urbanist20.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ),

          /// List of Best Products
          Positioned(
            top: widget.screenWidth * .9,
            child: SizedBox(
              height: widget.screenWidth * 0.63, // 👈 حددنا الارتفاع هنا
              width: widget.screenWidth,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: index == 0
                        ? CustomShowItemOutOfStock(screenWidth: widget.screenWidth)
                        : CustomShowItem(
                      screenWidth: widget.screenWidth,
                      item: BestSeller(
                        state: 'available',
                        id: '1',
                        title: 'Sample Item',
                        price: 100,
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
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
