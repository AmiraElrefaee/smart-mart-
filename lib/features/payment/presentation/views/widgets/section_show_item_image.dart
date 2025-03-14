import 'package:flutter/cupertino.dart';

import '../../../../scan_code/presentation/view/widgets/custom_photo_scanned_item.dart';

class sectionShowItemImage extends StatelessWidget {
  const sectionShowItemImage({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: screenWidth*.19*3,
      height: screenHeight*.1,
      child: ListView.builder(

          scrollDirection: Axis.horizontal,
          itemCount: 3,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context,index){
            return Padding(
              padding:  EdgeInsets.only(right:screenWidth*.015),
              child: CustomPhotoScannedItem(
                screenWidth: screenWidth*.15,
                screenHeight: screenHeight*.06,
              ),
            );
          }),
    );
  }
}