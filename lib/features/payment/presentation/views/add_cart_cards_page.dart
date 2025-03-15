import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_mart/features/payment/presentation/views/widgets/add_cart_cards_page_view.dart';
import 'package:smart_mart/features/payment/presentation/views/widgets/custom_appbar_check_out.dart';

class AddCartCardsPage extends StatelessWidget {
  const AddCartCardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      resizeToAvoidBottomInset: false,
      body:
      Column(
        children: [
          Container(
            height:  MediaQuery.of(context).size.height * 0.11,
            decoration: const BoxDecoration(
              color: Colors.white, // Ensure background color stays constant
              boxShadow: [
                BoxShadow(
                  color: Colors.black26, // Soft shadow effect
                  offset: Offset(0, 2), // Adjust shadow direction
                  blurRadius: 4, // Adjust shadow spread
                ),
              ],
            ),
            child: CustomAppBarCheckOut(
              title: 'Add cart',
            ),
          ),
          Expanded(child: AddCartCardsPageView()),
        ],
      ),

    );
  }
}
