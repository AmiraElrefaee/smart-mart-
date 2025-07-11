part of 'deatils_product_recet_cubit.dart';

@immutable
sealed class DeatilsProductRecetState {}

final class DeatilsProductRecetInitial extends DeatilsProductRecetState {}
final class DeatilsProductRecetLoading extends DeatilsProductRecetState {}
final class DeatilsProductFail extends DeatilsProductRecetState {}
final class DeatilsProductRecetSuccess extends DeatilsProductRecetState {
  final OrderModel order;

  DeatilsProductRecetSuccess(this.order);

}