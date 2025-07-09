import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_mart/features/scan_code/presentation/view/widgets/cart_page_view_body.dart';

import '../../../../core/utils/service_locator.dart';
import '../../../details_item/data/repo_imple/repo_imple_similar_product.dart';
import '../../../details_item/presentation/managers/similar_product_cubit/similar_product_cubit.dart';
import '../managers/     scanned_product_socket/scanned_product_socket_cubit.dart';

class CartPageView extends StatelessWidget {
  const CartPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SimilarProductCubit(getIt.get<RepoImpleSimilarProduct>()),
      child: Scaffold(
        body: CartPageViewBody(),
      ),
    );
  }
}
