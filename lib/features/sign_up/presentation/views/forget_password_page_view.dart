import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_mart/features/sign_up/presentation/views/widgets/forget_password_view_body.dart';

class ForgetPasswordPageView extends StatelessWidget {
  const ForgetPasswordPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ForgetPasswordViewBody(),
    );
  }
}
