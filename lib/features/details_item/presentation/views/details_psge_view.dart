import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_mart/core/domain/entities/item_model.dart';
import 'package:smart_mart/features/details_item/presentation/views/widgets/details_page_view_body.dart';

import '../../../../core/utils/service_locator.dart';
import '../../data/repo_imple/repo_imple_similar_product.dart';
import '../managers/similar_product_cubit/similar_product_cubit.dart';

class DetailsPageView extends StatelessWidget {
  const DetailsPageView({super.key, required this.item});

  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SimilarProductCubit(getIt.get<RepoImpleSimilarProduct>())..fetchSimilarProducts(id: item.id),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: DetailsPageViewBody(
          item: item,
        ),
      ),
    );
  }
}
