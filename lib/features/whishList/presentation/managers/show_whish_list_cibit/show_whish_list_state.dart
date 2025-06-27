part of 'show_whish_list_cubit.dart';

@immutable
sealed class ShowWhishListState {}

final class ShowWhishListInitial extends ShowWhishListState {}
final class GetWhishListItem extends ShowWhishListState {
  List<ItemModel> items;
  GetWhishListItem(this.items);
}
final class WhishListError extends ShowWhishListState {
  final String errorMessage;

  WhishListError(this.errorMessage);
}
