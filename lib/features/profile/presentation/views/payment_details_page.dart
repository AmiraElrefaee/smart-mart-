import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_mart/core/utils/service_locator.dart';
import 'package:smart_mart/features/profile/presentation/views/widgets/paymnet_details_page_view_body.dart';

import '../../data/models.dart';
import '../../data/repo_imple/repo_imple_recet_products.dart';
import '../managers/details_product_recet/deatils_product_recet_cubit.dart';
import '../managers/product_recet_cubit/product_recet_cubit.dart';

class PaymentDetailsPageView extends StatelessWidget {
  const PaymentDetailsPageView({super.key, required this.order});
  final OrderModel order;
  // final order = GoRouter.of(context).routerDelegate.currentConfiguration.extra as OrderModel;
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: BlocProvider(
        create: (context) => DeatilsProductRecetCubit()..fetchProducts(order: order),
        child: Scaffold(
          body: PaymnetDetailsPageViewBody(),
        ),
      ),
    );
  }
}
