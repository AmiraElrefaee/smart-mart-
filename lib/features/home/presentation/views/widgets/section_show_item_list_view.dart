import 'package:flutter/cupertino.dart';

import 'Custom_show_item.dart';

class SectonShowItemLisView extends StatelessWidget {
  const SectonShowItemLisView({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenWidth*.55,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context,index) {
            return Padding(
              padding: const EdgeInsets.only(left: 15),
              child: CustomShowItem(screenWidth: screenWidth),
            );
          }
      ),
    );
  }
}

