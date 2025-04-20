import 'package:flutter/cupertino.dart';

import '../../../domain2/entity/entity_scanned_item.dart';

class CustomPhotoScannedItem extends StatelessWidget {
  const CustomPhotoScannedItem({
    super.key,
    required this.screenHeight,
    required this.screenWidth, required this.index, required this.products,
  });

  final double screenHeight;
  final double screenWidth;
  final  int index;
  final List<Product> products;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              width: 1 ,
              color: Color(0xffDADADA)
          )
      ),
      child:Image.network(products[index].image,
        height: screenHeight,
        width: screenWidth,
      ),
    );
  }
}

