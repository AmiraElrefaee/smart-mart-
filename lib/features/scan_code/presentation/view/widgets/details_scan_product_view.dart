import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../category/data/models/sub_category_model.dart';
import '../../../../details_item/presentation/views/widgets/section_description_and_higlight.dart';
import '../../../../details_item/presentation/views/widgets/section_open_link.dart';
import '../../../../details_item/presentation/views/widgets/section_prices.dart';
import '../../../../details_item/presentation/views/widgets/section_show_product_photo.dart';
import '../../../../home/presentation/views/widgets/Custom_show_item.dart';

class DetailsScanProductView extends StatelessWidget {
  const DetailsScanProductView({
    super.key,
    required this.controller,
    required this.screenWidth,
  });

  final ScrollController controller;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 100), // Adjust based on `SectionTopBar` height
      child: SingleChildScrollView(
        controller:controller ,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * .058),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionShowProductPhoto(screenWidth: screenWidth, photo: '',
                  id: '1',
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SectionOpenLink(
                          brand: '',
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            color: Color(0xffDADADA),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            'Pasta',
                            style: Styles.Urbanist16,
                          ),
                        ),
                        Text(
                          'Eldoha Easy Pasta Creamy Pesto Sauce Pasta ',
                          style: Styles.Urbanist16.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: screenWidth * .04,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          '( 185gm )',
                          style: Styles.Urbanist16.copyWith(
                            color: Color(0xff484C52),
                            fontWeight: FontWeight.w600,
                            fontSize: screenWidth * .042,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: SectionPrices(
                            price: 0,
                            discount: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SectionDEscriptionAndHighlight(screenWidth: screenWidth,
                  Description: '',
                    highlights: '',
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'Similar Products',
                      style: Styles.Urbanist25,
                    ),
                  ),
                  SizedBox(
                    height: screenWidth * .48,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: screenWidth * .03),
                            width: screenWidth * .46,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Color(0xffD9D9D9),
                                width: 1,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Center(
                                    child: Image.asset(
                                      'assets/items/image (1).png',
                                      height: screenWidth * .25,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Eldoha Easy Pasta Italian Red Sauce Pasta ',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: Styles.NexaBold14.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  '- 185gm',
                                  style: Styles.NexaBold14.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff484C52),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 20),
                    child: Text(
                      'Frequently Bought Together',
                      style: Styles.Urbanist25,
                    ),
                  ),
                  SizedBox(
                    height: screenWidth * .6,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: CustomShowItem(screenWidth: screenWidth,
                        item: BestSeller(
                          subCategoryName: '',
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
                        ),
                        ));
                      },
                    ),
                  ),
                  SizedBox(height: 150),
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}


