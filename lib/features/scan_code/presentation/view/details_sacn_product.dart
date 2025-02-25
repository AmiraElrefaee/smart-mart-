import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_mart/features/details_item/presentation/views/widgets/section_arrow_back.dart';
import 'package:smart_mart/features/details_item/presentation/views/widgets/section_description_and_higlight.dart';
import 'package:smart_mart/features/details_item/presentation/views/widgets/section_open_link.dart';
import 'package:smart_mart/features/details_item/presentation/views/widgets/section_prices.dart';
import 'package:smart_mart/features/details_item/presentation/views/widgets/section_show_product_photo.dart';
import 'package:smart_mart/features/home/presentation/views/widgets/custom_search_bar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../const.dart';
import '../../../../../core/utils/styles.dart';
import '../../../home/presentation/views/widgets/Custom_show_item.dart';


class DetailsSacnProduct extends StatelessWidget {
  const DetailsSacnProduct({super.key,

    required this.controller

  });


final ScrollController controller;


  @override
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // Scrollable content
          Padding(
            padding: EdgeInsets.only(top: 100), // Adjust based on `SectionTopBar` height
            child: SingleChildScrollView(
              controller: controller,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * .058),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SectionShowProductPhoto(screenWidth: screenWidth),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SectionOpenLink(),
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
                                child: SectionPrices(),
                              ),
                            ],
                          ),
                        ),
                        SectionDEscriptionAndHighlight(screenWidth: screenWidth),
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
                          height: screenWidth * .58,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: CustomShowItem(screenWidth: screenWidth),
                              );
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
          ),

          // Fixed Top Bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SectionTopBar(),
          ),
        ],
      ),
    );
  }}


  class SectionTopBar extends StatelessWidget {
  const SectionTopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20,
      top: 20
      ),
      decoration: BoxDecoration(
        color: Colors.white, // Background color
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color:ksecodaryColor.withOpacity(0.2), // Shadow color with opacity
            spreadRadius: .5, // How much the shadow spreads
            blurRadius: 4, // Blurriness of the shadow
            offset: Offset(0, 4), // Moves shadow down (X: 0, Y: 4)
          ),
        ],
      ),
      child: Column(children: [
        Container(
          margin:EdgeInsets.only(
              bottom: 25
          ),
          width: MediaQuery.of(context).size.width*.35,
          height: 5,

          decoration: BoxDecoration(
              color: Color(0xffDADADA),
              borderRadius: BorderRadius.circular(20)
          ),

        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            SvgPicture.asset('assets/icons/Vector (11).svg',
              color: Color(0xff484C52),
              width: 25,
            ),
            Text('  Scanned Product',
              style: TextStyle(
                  fontFamily: 'Urbanist',
                  color: Color(0xff484C52),
                  fontSize: 20,
                  fontWeight: FontWeight.w600
              ),
            )
          ],),


      ],),
    );
  }
}

