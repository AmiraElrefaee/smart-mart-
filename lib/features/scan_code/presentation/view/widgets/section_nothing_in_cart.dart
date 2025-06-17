import 'package:flutter/cupertino.dart';

import 'cart_page_view_body.dart';
import 'custom_app_bar.dart';

class SectionNothingInCart extends StatelessWidget {
  const SectionNothingInCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         CustomAppBarCartPage(),
        const Spacer(),
        Image.asset('assets/items/empty-cart 1.png'),
        const Text(
          'There’s nothing in your cart yet !',
          style: TextStyle(
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
        const Text(
          'Add item to your Basket ',
          style: TextStyle(
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.w500,
            fontSize: 15,
            color: Color(0xff989797),
          ),
        ),
        const Spacer(flex: 2),
      ],
    );
  }
}
