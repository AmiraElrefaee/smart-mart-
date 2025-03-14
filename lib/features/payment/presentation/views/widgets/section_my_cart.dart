import 'package:flutter/cupertino.dart';
import 'package:smart_mart/features/payment/presentation/views/widgets/payment_page_view_body.dart';
import 'package:smart_mart/features/payment/presentation/views/widgets/section_show_item_image.dart';
import 'package:smart_mart/features/payment/presentation/views/widgets/top_of_my_cart.dart';

class SectionMyCart extends StatelessWidget {
  const SectionMyCart({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopOfMyCart(),
        Padding(
          padding:  EdgeInsets.only(left: screenWidth*.02),
          child: Row(
            children: [

              sectionShowItemImage(screenWidth: screenWidth, screenHeight: screenHeight),
              Column(children: [
                Text('+ 2 items',
                  style:  TextStyle(
                      fontFamily: 'Urbanist',
                      fontSize: screenWidth*.035,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff989797)
                  ),
                ),Text('(total : 5 items )',
                  style:  TextStyle(
                      fontFamily: 'Urbanist',
                      fontSize: screenWidth*.035,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff484C52)
                  ),
                )

              ],),


            ],),
        ),
      ],
    );
  }
}
