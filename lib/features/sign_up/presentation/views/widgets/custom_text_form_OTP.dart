import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

import '../../../../../const.dart';
import '../../../../../core/utils/functions/Navigate_to_page.dart';
import '../../../../../core/utils/functions/app_router.dart';
import '../../managers/OTP_sign_up_cubit/otp_sign_up_cubit.dart';

class CustomTextFormOTP extends StatelessWidget {
  CustomTextFormOTP({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.defaultPinTheme,
    required this.onCompleted,
  });

  final double screenHeight;
  final double screenWidth;
  final PinTheme defaultPinTheme;
 final  void Function(String)? onCompleted;

  final TextEditingController _pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenHeight * .05),
      child: Pinput(
        controller: _pinController,
        // 👈 ربط الكنترولر
        cursor: Container(
          color: kColor,
          width: 2,
          height: screenWidth * .1,
        ),
        keyboardType: TextInputType.text,
        showCursor: true,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        length: 5,
        defaultPinTheme: defaultPinTheme,
        focusedPinTheme: defaultPinTheme.copyWith(
          decoration: defaultPinTheme.decoration!.copyWith(
            border: Border.all(color: kColor),
          ),
        ),
        onCompleted: onCompleted

        //     (pin) {
        //   debugPrint("اللي اتكتب: $pin");
        //   debugPrint("من الكنترولر: ${_pinController.text}");
        //   BlocProvider.of<OtpSignUpCubit>(context).OtpSignUp(OTP: pin);
        // },
      ),
    );
  }
}
