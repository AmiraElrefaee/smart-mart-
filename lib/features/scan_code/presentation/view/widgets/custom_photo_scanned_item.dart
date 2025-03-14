import 'package:flutter/cupertino.dart';

class CustomPhotoScannedItem extends StatelessWidget {
  const CustomPhotoScannedItem({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

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
      child: Image.asset('assets/items/image 15.png',
        height: screenHeight,
        width: screenWidth,
      ),
    );
  }
}

