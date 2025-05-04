part of 'sub_category_cubit.dart';

@immutable
abstract class SubCategoryState {}

class SubCategoryInitial extends SubCategoryState {}

class SubCategoryLoading extends SubCategoryState {}

class SubCategorySucess extends SubCategoryState {
  final List<SubCategoryModel> subCategories;
  final List<BestSeller> bestSellers;
  SubCategorySucess( {required this.subCategories,
    required this.bestSellers
  });
}

class SubCategoryBestSellerSucess extends SubCategoryState {
  final List<BestSeller> bestSellers;

  SubCategoryBestSellerSucess({required this.bestSellers});
}

class SubCategoryError extends SubCategoryState {
  final String message;

  SubCategoryError({required this.message});
}
