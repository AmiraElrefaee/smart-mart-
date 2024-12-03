import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_mart/features/sign_up/presentation/views/widgets/OTP_forget_password_view_body.dart';

class OtpForgetPasswordPageView extends StatelessWidget {
  const OtpForgetPasswordPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OtpForgetPasswordViewBody() ,
    );
  }
}
