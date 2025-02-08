import 'package:flutter/cupertino.dart';
import 'package:smart_mart/features/home/presentation/views/widgets/section_best_sale_photo.dart';

import 'Section_ramadan_offers_photo.dart';

class SectionScrolableOffers extends StatelessWidget {
  const SectionScrolableOffers({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding:  EdgeInsets.only(left:  screenWidth * .07,),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SectionRamdanOffersPhoto(screenWidth: screenWidth),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: sectionBestSalePhoto(screenWidth: screenWidth),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: sectionBestSalePhoto(screenWidth: screenWidth),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: sectionBestSalePhoto(screenWidth: screenWidth),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: sectionBestSalePhoto(screenWidth: screenWidth),
            ),



          ],),
      ),
    );
  }
}


