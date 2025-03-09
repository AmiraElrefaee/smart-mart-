import 'package:flutter/cupertino.dart';
import 'package:smart_mart/features/scan_code/presentation/view/widgets/section_add_or_scaa.dart';

import 'custom_add_or_minus.dart';

class SectionAddMore extends StatelessWidget {
  const SectionAddMore({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth=MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('add more of this ?',
          style: TextStyle(
            fontFamily: 'Urbanist',
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),

        CustomAddOrMinusBotton(
          screenHeight:40,
          screenWidth: screenWidth*.19,
        )

      ],);
  }
}