import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../const.dart';
import '../../../../../core/utils/functions/app_router.dart';
import '../../../../../core/widgets/custom_botton.dart';
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
        // CustomBotton(
        //   text: 'Check out',
        //   background: kColor,
        //   colorText: Colors.white,
        //   screenHeight:MediaQuery.of(context).size.height,
        //   screenWidth: MediaQuery.of(context).size.width,
        //   onTap: () {
        //     // SocketService().emitCheckout();
        //     context.push(AppRouter.kPayment);
        //   },
        // ), const Spacer(flex: 2),
      ],
    );
  }
}
