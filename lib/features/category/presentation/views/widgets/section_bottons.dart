import 'package:flutter/cupertino.dart';
import 'custom_bottons_filter.dart';

class SectionBottons extends StatelessWidget {
  const SectionBottons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(

        children: [
          CustomBottonsFilter(
            text: 'Filter',
            icon: 'assets/icons/Vector.svg',
          ),
          CustomBottonsFilter(
            text: 'Sort',
            icon: 'assets/icons/sort.svg',
          ),
          CustomBottonsFilter(
            text: 'Offers',
            icon: 'assets/icons/offers.svg',
          )

        ],),
    );
  }
}
