part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}
final class SearchLoading extends SearchState {}
final class SearchSuccess extends SearchState {
  final List<ItemModel> Items;

  SearchSuccess(this.Items);
}
final class SearchFailuer extends SearchState {}


