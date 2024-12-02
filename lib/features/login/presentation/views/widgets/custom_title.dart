import 'package:flutter/cupertino.dart';

import '../../../../../const.dart';
import '../../../../../utils/styles.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({super.key,

    required this.title, required this.subTitle});

  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title, // Assuming `contents[index].title` is the title
          style: Styles.NexaBold32.copyWith(
          height: 0,
              fontSize: .041*MediaQuery.of(context).size.height),
          textAlign: TextAlign.center,

        ),
        SizedBox(height: 0),
        Text(subTitle,
          style: Styles.Urbanist25.copyWith(color: kcolor3,

              fontSize: .02*MediaQuery.of(context).size.height),

            )
      ],
    );
  }
}
