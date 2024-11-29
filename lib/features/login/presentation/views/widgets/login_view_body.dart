import 'package:flutter/cupertino.dart';

import '../../../../on_boarding/presentation/views/widgets/custom_background_images.dart';
import 'custom_background.dart';
import 'custom_form.dart';
import 'custom_title.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: SizedBox(
        height: screenHeight,
        child: Stack(children: [
          CustomBackground(),
          CustomTitle(),
          CustomForm(),

        ],),
      ),
    );
  }
}
