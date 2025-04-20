part of 'scanned_item_cubit.dart';

@immutable
sealed class ScannedItemState {}

final class ScannedItemInitial extends ScannedItemState {}
class ScannedItemLoading extends ScannedItemState {}

class ScannedItemSuccess extends ScannedItemState {
  final List<Product> products;

  ScannedItemSuccess(this.products);
}

class ScannedItemError extends ScannedItemState {
  final String message;

  ScannedItemError(this.message);
}