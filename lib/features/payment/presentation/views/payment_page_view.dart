import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:smart_mart/features/payment/presentation/views/widgets/custom_appbar_check_out.dart';
import 'package:smart_mart/features/payment/presentation/views/widgets/payment_page_view_body.dart';

class PaymentPageView extends StatelessWidget {
  const PaymentPageView({super.key});

  @override
  Widget build(BuildContext context) {
    double appBarHeight = MediaQuery.of(context).size.height * 0.11;

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: appBarHeight,
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
            child: CustomAppBarCheckOut(),
          ),
          Expanded(
            child: PaymentPageViewBody(), // Your ListView is inside this
          ),
        ],
      ),
    );
  }
}

