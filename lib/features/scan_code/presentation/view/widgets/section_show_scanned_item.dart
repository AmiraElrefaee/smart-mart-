import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_mart/features/scan_code/presentation/view/widgets/section_add_or_scaa.dart';
import 'package:smart_mart/features/scan_code/presentation/view/widgets/section_payment_summary.dart';
import 'package:smart_mart/features/scan_code/presentation/view/widgets/section_top_bar.dart';
import 'package:smart_mart/features/scan_code/presentation/view/widgets/section_top_bar_scanned_item.dart';

import '../../../../../const.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../details_item/presentation/views/widgets/section_description_and_higlight.dart';
import '../../../../details_item/presentation/views/widgets/section_open_link.dart';
import '../../../../details_item/presentation/views/widgets/section_prices.dart';
import '../../../../details_item/presentation/views/widgets/section_show_product_photo.dart';
import '../../../../home/presentation/views/widgets/Custom_show_item.dart';
import '../../../../home/presentation/views/widgets/custom_grid_best_sale.dart';
import '../../../../home/presentation/views/widgets/custom_price.dart';
import 'SectionAddMore.dart';
import 'bottons_scanned_item.dart';
import 'custom_add_or_minus.dart';
import 'custom_details_scanned_ittem.dart';
import 'custom_line.dart';

class SectionShowScannedItem extends StatelessWidget {
  const SectionShowScannedItem({super.key});



  get controller => null;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          // Scrollable content using CustomScrollView
        CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              // List of products using SliverList
              SliverToBoxAdapter(child: SizedBox(height: 120,)),
              // SliverGrid(delegate: delegate, gridDelegate: gridDelegate),
              SliverList(

                delegate: SliverChildBuilderDelegate((context, index) {
                  return Padding(
                      padding:  EdgeInsets.symmetric(vertical: 12,
                     horizontal:screenWidth*.06
                      ),
                    child: customDetailsSCannedItem(screenHeight: screenHeight,
                        screenWidth: screenWidth),
                    );
                  },
                  childCount: 3,
                    addRepaintBoundaries:false
                    // Replace with your actual item count
                ),
              ),

              // Additional content below the ListView
              SliverToBoxAdapter(
                child: Column(

                  children: [
                    // Add any widgets you want below the ListView
                    customLine2(screenWidth: screenWidth),
                    Container(

                      padding: EdgeInsets.symmetric(vertical: 18,
                      horizontal: 12),
                      width: screenWidth,
                      margin: EdgeInsets.symmetric(vertical: 12,
                        horizontal:   screenWidth*.06
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xffF8F8F8),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SectionPaymentSummary(screenWidth: screenWidth),
                    )
                    // Add more widgets here if needed
                  ],
                ),
              ),
            ],
          ),

          // Fixed Bottom Buttons
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SectionTopBarScannedItem()),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: bottonsScannedItem(
              onTap: (){
                showModalBottomSheet(
                    isScrollControlled: true,
                    useRootNavigator: true,
                  context: context,
                    builder: (context){
                      return Container(
                        height: screenHeight,
                        color: Colors.white,
                        child: Stack(
                          children: [

                            Positioned(
                              child: Padding(
                                padding:  EdgeInsets.symmetric(horizontal:screenWidth * .08,

                                ),
                                child: CustomGridBestSale(
                                    scroll: true,
                                    screenWidth: screenWidth, ViewAll: true),),
                            ),
                            Positioned(
                            // top: 120,
                            left: 0,
                            right: 0,
                            child: SectionTopBarScannedItem()),
                        Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: bottonsScannedItem(onTap: (){},))
                          ],
                        ),
                      ) ;
                    }
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}





