part of 'similar_product_cubit.dart';

@immutable
sealed class SimilarProductState {}

final class SimilarProductInitial extends SimilarProductState {}
final class SimilarProductLoading extends SimilarProductState {}
final class SimilarProductSuccess extends SimilarProductState {
  List<ItemModel> product;
  SimilarProductSuccess(this.product);
}
final class SimilarProductFailuer extends SimilarProductState {}

