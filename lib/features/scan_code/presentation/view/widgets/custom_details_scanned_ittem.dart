import 'package:flutter/cupertino.dart';

import '../../../../../const.dart';
import '../../../../../core/utils/styles.dart';
import '../../../domain2/entity/entity_scanned_item.dart';
import 'custom_add_or_minus.dart';
import 'custom_photo_scanned_item.dart';

class customDetailsSCannedItem extends StatelessWidget {
  const customDetailsSCannedItem({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.products,
    required this.index
  });
 final  int index;
  final List<Product> products;
  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomPhotoScannedItem(
          products: products,
            index: index,
            screenHeight: screenHeight*.11,
            screenWidth: screenWidth*.18),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(products[index].id,
              style: Styles.NexaBold14.copyWith(
                  fontWeight: FontWeight.w500
              ),

            ),
            Text('${products[index].weight}  gm',
              style: Styles.NexaBold14.copyWith(
                  fontWeight: FontWeight.w500
              ),),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('EGP ${products[index].price}',
                  style: TextStyle(
                      fontFamily: 'Urbanist'
                      ,fontSize: 16,
                      color: kColor,
                      fontWeight: FontWeight.w600
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text('EGP ${products[index].price}',

                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    fontFamily: 'Urbanist'
                    ,fontSize: 16,
                    color: Color(0xff989797),
                    fontWeight: FontWeight.w600,

                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 5,
            ),

            // CustomPrice(screenWidth: screenWidth),
            SizedBox(height: 10,)

          ],),
        Padding(
          padding:  EdgeInsets.only(top: screenWidth*.05),
          child: CustomAddOrMinusBotton(
            screenHeight:32,
            screenWidth: screenWidth*.21,
          ),
        )

      ],
    );
  }
}

