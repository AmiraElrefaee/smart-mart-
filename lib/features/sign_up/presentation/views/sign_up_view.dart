import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_mart/features/sign_up/presentation/views/widgets/signup_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SignupViewBody(),);
  }
}
