part of 'whish_list_cubit.dart';

@immutable
sealed class WhishListState {}

final class WhishListInitial extends WhishListState {}

final class AddToWhishList extends WhishListState {}

final class RemoveFromWhishList extends WhishListState {}

final class GetWhishListItem extends WhishListState {

  List<ItemModel> items;
  GetWhishListItem(this.items);
}
final class WhishListLoading extends WhishListState {}
final class WhishListError extends WhishListState {
  final String errorMessage;

  WhishListError(this.errorMessage);

}
// غيرت الحرف ال
// أول G كبير لتطابق التسمية
