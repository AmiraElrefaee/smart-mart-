import 'package:flutter/cupertino.dart';

import '../../const.dart';
import '../utils/styles.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({super.key,

    required this.title, required this.subTitle, required this.fontTitle, required this.fontSubTitle, required this.sizeBox});

  final String title;
  final String subTitle;
  final double fontTitle;
  final double fontSubTitle;
final double sizeBox;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title, // Assuming `contents[index].title` is the title
          style: Styles.NexaBold32.copyWith(
          height: 0,
              fontSize: fontTitle),
          textAlign: TextAlign.center,

        ),
        SizedBox(height: sizeBox),
        Text(subTitle,
          style: Styles.Urbanist25.copyWith(color: kcolor3,

              fontSize: fontSubTitle),

            )
      ],
    );
  }
}
