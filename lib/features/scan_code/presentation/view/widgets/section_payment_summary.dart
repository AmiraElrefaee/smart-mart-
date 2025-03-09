import 'package:flutter/cupertino.dart';
import 'package:smart_mart/features/scan_code/presentation/view/widgets/section_show_scanned_item.dart';

import 'custom_line.dart';
import 'custom_prices.dart';

class SectionPaymentSummary extends StatelessWidget {
  const SectionPaymentSummary({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Text('Payment summary',
            style: TextStyle(
                fontFamily: 'Urbanist',
                fontSize: 17,
                fontWeight: FontWeight.w600
            ),),
        ),
        customPrices(
          title: 'Subtotal',
          kindMoney: 'EGP',
          price: 300,
        ),
        SizedBox(height: 15,),
        customPrices(
          title: 'Discount',
          kindMoney: '-EGP',
          price: 40,
        ),


        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Center(child: customLine2(screenWidth: screenWidth)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),

          child: customPrices(
            title: 'Total',
            kindMoney: 'EGP',
            price: 260,
          ),

        )

      ],
    );
  }
}
