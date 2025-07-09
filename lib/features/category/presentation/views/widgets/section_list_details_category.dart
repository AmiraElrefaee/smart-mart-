import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_mart/features/category/presentation/managers/Sub_category_cubit/sub_category_cubit.dart';

import 'package:smart_mart/features/category/presentation/managers/selected_sub_category_cubit/selected_sub_categoru_state.dart';
import 'package:smart_mart/features/category/presentation/views/widgets/section_best_sale_category.dart';
import 'package:smart_mart/features/category/presentation/views/widgets/section_details_bottons.dart';

import '../../../../../const.dart';
import '../../../data/models/sub_category_model.dart';
import '../../managers/product_sub_category_cubit/product_sub_category_cubit.dart';
import '../../managers/selected_sub_category_cubit/selected_sub_category_cubit.dart';

class SectionListDetailsCategory extends StatelessWidget {
  const SectionListDetailsCategory({super.key, required this.screenWidth});
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SubCategoryCubit, SubCategoryState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is SubCategorySucess) {
          final mid = (state.subCategories.length / 2).ceil();
          final topList = state.subCategories.take(mid).toList();
          final bottomList = state.subCategories.skip(mid).toList();

          return Padding(
            padding: const EdgeInsets.only(left: 15, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildCategoryList(context, topList, screenWidth),
                const SizedBox(height: 5),
                _buildCategoryList(context, bottomList, screenWidth),
                BlocBuilder<SelectedSubCategoryCubit, SelectedSubCategoryState>(
                  builder: (context, state2) {
                    if (state2 is SubCategorySelected) {
                      context.read<ProductSubCategoryCubit>().FetchProduct(name: state2.selectedId);
                      return SectionDetailsBottons(name: state2.name);
                    } else {
                      return SectionBestSaleCategory(
                        screenWidth: screenWidth,
                        bestSale: state.bestSellers,
                      );

                    }
                  },
                ),
              ],
            ),
          );
        } else {
          return const Center(child: Text('Loading...'));
        }
      },
    );
  }

  Widget _buildCategoryList(
      BuildContext context,
      List<SubCategoryModel> categoryList,
      double screenWidth,
      ) {
    final selectedState = context.watch<SelectedSubCategoryCubit>().state;
    String? selectedId;
    if (selectedState is SubCategorySelected) {
      selectedId = selectedState.selectedId;
    }


    return SizedBox(
      width: screenWidth,
      height: screenWidth * .17,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          final model = categoryList[index];
          final selected = model.id == selectedId;

          return GestureDetector(
            onTap: () {
              context.read<SelectedSubCategoryCubit>().select(model.id, model.name);
            },
            child: Container(
              margin: const EdgeInsets.only(left: 12, top: 6),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: const Color(0xffF8F8F8),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 1,
                  color: selected ? kColor : const Color(0xffF8F8F8),
                ),
              ),
              child: Row(
                children: [
                  SizedBox(
                    height: screenWidth * .12,
                    child: CachedNetworkImage(
                      imageUrl: model.image,
                      fit: BoxFit.fill,
                      placeholder: (context, url) => Container(
                        color: Colors.grey.shade300,
                        child: const Center(child: CircularProgressIndicator(color: kColor)),
                      ),
                      errorWidget: (context, url, error) => const Center(
                        child: Icon(Icons.error, color: Colors.grey),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    model.name,
                    style: TextStyle(
                      color: selected ? kColor : kcolor4,
                      fontSize: 15,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
