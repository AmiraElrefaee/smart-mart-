part of 'fetch_product_cubit.dart';

@immutable
sealed class FetchProductState {}

final class FetchProductInitial extends FetchProductState {}
final class FetchProductLoading extends FetchProductState {}
final class FetchProductSucces extends FetchProductState {
  List<ItemModel> products;
  FetchProductSucces({ required this.products});
}
final class FetchProductFailed extends FetchProductState {}