import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_mart/features/profile/presentation/views/widgets/section_app_bar_profile.dart';
import 'package:smart_mart/features/profile/presentation/views/widgets/section_payment_recet.dart';

class PaymentHistoryPageView extends StatelessWidget {
  const PaymentHistoryPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 27.w,vertical: 30),
      child: Column(children: [

        SecttionAppBarProfile(
          title: 'Payment History',
        ),

        SectionpaymentsRecet()
      ],),
    );
  }
}

