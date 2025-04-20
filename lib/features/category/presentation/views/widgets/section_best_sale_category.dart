import 'package:flutter/cupertino.dart';

import '../../../../home/presentation/views/widgets/Custom_show_item.dart';

class SectionBestSaleCategory extends StatelessWidget {
  const SectionBestSaleCategory({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Best Sale',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600
            ),),
          SizedBox(
            height: 20,
          ),

          SizedBox(
            height: screenWidth*.6,
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
          SizedBox(
            height: 20,
          ),
          Text('Best in Baby Diapers',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600
            ),),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: screenWidth*.6,
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
          SizedBox(height: 100,)

        ],
      ),
    );
  }
}

