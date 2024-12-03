import 'package:flutter/cupertino.dart';
import 'package:pinput/pinput.dart';

import '../../../../../const.dart';

class CustomTextFormOTP extends StatelessWidget {
  const CustomTextFormOTP({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.defaultPinTheme,
  });

  final double screenHeight;
  final double screenWidth;
  final PinTheme defaultPinTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: screenHeight*.05),
      child: Pinput(
        cursor:Container(
          color: kColor,
          width: 2,
          height: screenWidth*.1,
        ) ,
        showCursor: true,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        length: 4,
        defaultPinTheme: defaultPinTheme,
        focusedPinTheme: defaultPinTheme.copyWith(
          decoration: defaultPinTheme.decoration!.copyWith(
            border: Border.all(color: kColor),
          ),
        ),
        onCompleted: (pin) => debugPrint(pin),
      ),
    );
  }
}