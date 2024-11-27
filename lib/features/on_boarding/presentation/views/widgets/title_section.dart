import 'package:flutter/cupertino.dart';
import 'package:smart_mart/features/on_boarding/data/models/content_model.dart';

import '../../../../../utils/styles.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({super.key, required this.index});
final int index;
  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Positioned(
          key: ValueKey<int>(index), // This ensures the widget rebuilds and triggers animation
          width: MediaQuery.of(context).size.width,
          top: MediaQuery.of(context).size.height * .57,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .107),
            child: Text(
              contents[index].title, // Assuming `contents[index].title` is the title
              style: Styles.NexaBold30,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
