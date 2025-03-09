import 'package:flutter/cupertino.dart';

class customLine2 extends StatelessWidget {
  const customLine2({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.symmetric(vertical: 12),

      alignment: Alignment.center,
      width: screenWidth*.75,
      height: 1,
      color: Color(0xffD4D4D4),
    );
  }
}

