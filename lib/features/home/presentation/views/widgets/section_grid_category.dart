import 'package:flutter/cupertino.dart';

import '../../../../../const.dart';
import '../../../../../core/utils/styles.dart';

class SectionGridCategory extends StatelessWidget {
  const SectionGridCategory({
    super.key,
    required this.screenWidth,
    required this.viewall,
  });

  final double screenWidth;
  final bool viewall;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal:screenWidth * .08 ),
      child: GridView.builder(
          shrinkWrap: true, // لجعل GridView تتكيف مع المحتوى
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // عدد العناصر في الصف
            crossAxisSpacing: 10, // المسافة بين العناصر أفقيًا
            mainAxisSpacing:10,

            mainAxisExtent: screenWidth * 0.27,

            // المسافة بين العناصر عموديًا

          ),
          itemCount: viewall?15:9,
          itemBuilder: (context, snapshot) {
            return Container(
              // width: screenWidth*.25,
              // height: screenWidth*.23,
              // alignment: Alignment.center,
              decoration: BoxDecoration(

                color: Color(0xffF8F8F8),
                borderRadius: BorderRadius.circular(10),

              ),
              child: Column(children: [
                Image.asset('assets/back_grounds/image.png',
                  height: 95,
                ),
                Text('Drinks',
                  style: Styles.NexaBold14.copyWith(
                      fontSize: screenWidth*.032,
                      color: kColor
                  ),
                )

              ],),
            );
          }
      ),
    );
  }
}

