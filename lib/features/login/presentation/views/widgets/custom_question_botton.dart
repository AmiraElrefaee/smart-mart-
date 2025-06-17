import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/widgets/custom_side_text.dart';
import '../../../../../core/widgets/custom_text_botton.dart';

class CustomQuesBotton extends StatelessWidget {
  const CustomQuesBotton({
    super.key, required this.mainQest, required this.bottonText,
      this.onTap
  });
final String mainQest;
final String bottonText;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomSideText(text: mainQest,),

        CustomTextBottom(
          onTap:onTap,


          text: bottonText,
        ),
      ],);
  }
}
