import 'package:flutter/cupertino.dart';

import '../../../../../const.dart';
import '../../../data/models/content_model.dart';

class SectionTriggerPoints extends StatelessWidget {
  const SectionTriggerPoints({
    super.key,
    required this.currentIndex,
  });

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        width: MediaQuery.of(context).size.width,
        top: MediaQuery.of(context).size.height * .5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            contents.length,
                (index) =>  AnimatedContainer(
              duration: const Duration(milliseconds: 1000),
              curve: Curves.easeInOut,
              height: 10,
              width:  currentIndex == index ? 58 : 10,
              margin: EdgeInsets.only(right: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: currentIndex == index ? kColor : Color(0xffD9D9D9),
              ),
            ),
          ),
        ));
  }
}
