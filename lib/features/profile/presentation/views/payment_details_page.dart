import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_mart/features/profile/presentation/views/widgets/paymnet_details_page_view_body.dart';

class PaymentDetailsPageView extends StatelessWidget {
  const PaymentDetailsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PaymnetDetailsPageViewBody(),
      ),
    );
  }
}
