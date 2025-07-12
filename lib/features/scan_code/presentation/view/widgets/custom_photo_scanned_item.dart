import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../domain2/entity/entity_scanned_item.dart';

class CustomPhotoScannedItem extends StatelessWidget {
  const CustomPhotoScannedItem({
    super.key,
    required this.screenHeight,
    required this.screenWidth, required this.index, required this.image,
    // required this.products,
  });

  final double screenHeight;
  final double screenWidth;
  final  int index;
  final String image ;
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
   child:CachedNetworkImage(
     imageUrl: image,
     width: screenWidth,
     height: screenHeight,
     placeholder: (context, url) => Center(child: CircularProgressIndicator()),
     errorWidget: (context, url, error) => Icon(Icons.error, color: Colors.red),
   ),
      // Image.network(image
      //   // products[index].image
      //   ,
      //   height: screenHeight,
      //   width: screenWidth,
      // ),
    );
  }
}

