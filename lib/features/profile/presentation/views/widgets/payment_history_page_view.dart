import 'package:flutter/cupertino.dart';
import 'package:smart_mart/features/profile/presentation/views/widgets/section_app_bar_profile.dart';

class PaymentHistoryPageView extends StatelessWidget {
  const PaymentHistoryPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 30),
      child: Column(children: [

        SecttionAppBarProfile(
          title: 'Payment History',
        ),
      ],),
    );
  }
}
