import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_mart/features/profile/presentation/views/widgets/section_app_bar_profile.dart';
import 'package:smart_mart/features/profile/presentation/views/widgets/section_payment_recet.dart';

import '../../managers/product_recet_cubit/product_recet_cubit.dart';

class PaymentHistoryPageView extends StatefulWidget {
  const PaymentHistoryPageView({super.key});

  @override
  State<PaymentHistoryPageView> createState() => _PaymentHistoryPageViewState();
}

class _PaymentHistoryPageViewState extends State<PaymentHistoryPageView> {
  void initState() {
    super.initState();
    context.read<ProductRecetCubit>().fetchProducts();
  }
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

