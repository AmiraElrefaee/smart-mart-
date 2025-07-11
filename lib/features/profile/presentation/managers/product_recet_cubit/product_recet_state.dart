part of 'product_recet_cubit.dart';

@immutable
sealed class ProductRecetState {}

final class ProductRecetInitial extends ProductRecetState {}
final class ProductRecetSuccess extends ProductRecetState {
  final List<OrderModel>orders;

  ProductRecetSuccess(this.orders);
}
final class ProductRecetlaodind extends ProductRecetState {}
final class ProductRecetFail extends ProductRecetState {}