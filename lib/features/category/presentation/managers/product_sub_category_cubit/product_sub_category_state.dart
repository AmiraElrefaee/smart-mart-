part of 'product_sub_category_cubit.dart';

@immutable
sealed class ProductSubCategoryState {}

final class ProductSubCategoryInitial extends ProductSubCategoryState {}
final class ProductSubCategoryLaoding extends ProductSubCategoryState {}
final class ProductSubCategorySuccess extends ProductSubCategoryState {
  final List<ItemModel>product;

  ProductSubCategorySuccess({required this.product});
}
final class ProductSubCategoryFail extends ProductSubCategoryState {
}