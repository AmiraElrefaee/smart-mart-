import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_mart/features/sign_up/presentation/views/widgets/create_new_password_page_view_body.dart';

class CreateNewPasswordpageView extends StatelessWidget {
  const CreateNewPasswordpageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: CreateNewPasswordPageViewBody(),
    );
  }
}
