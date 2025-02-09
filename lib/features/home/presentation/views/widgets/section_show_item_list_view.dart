import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

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
      width: screenWidth,
      height: screenWidth*1.03,
      child: Stack(
        // fit : StackFit.passthrough,
        children: [
          Positioned.fill(
            top: 0,
            left: 0,
            right: 0,
            bottom:screenWidth*.17,
            child: SvgPicture.asset('assets/back_grounds/Group 39.svg',
              fit: BoxFit.fitWidth,
              width: screenWidth,
              height: 50,
            ),
          ),
          Positioned(
              top: screenWidth*.22,
              left: screenWidth*.34,
              child: SvgPicture.asset('assets/icons/Frame 1984078145 (1).svg',
              height: screenWidth*.13,
              )),

          Positioned.fill(
            top: screenWidth*.47,
            child: SizedBox(
              // height: screenWidth*.35,
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
            ),
          ),
        ],
      ),
    );
  }
}

