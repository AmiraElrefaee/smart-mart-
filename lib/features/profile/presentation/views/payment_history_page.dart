import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_mart/features/profile/presentation/views/widgets/payment_history_page_view.dart';

import '../../../../core/utils/service_locator.dart';
import '../../data/repo_imple/repo_imple_recet_products.dart';
import '../managers/details_product_recet/deatils_product_recet_cubit.dart';
import '../managers/product_recet_cubit/product_recet_cubit.dart';

class PaymentHistoryPage extends StatelessWidget {
  const PaymentHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:

        MultiBlocProvider(
      providers: [
      BlocProvider(
      create: (context) => ProductRecetCubit(getIt.get<RepoImpleRecetProducts>()),),
    BlocProvider(
    create: (context) => DeatilsProductRecetCubit(),)
    ],
    child:Scaffold(
          body: PaymentHistoryPageView(),
        ),
      ),
    );
  }
}
