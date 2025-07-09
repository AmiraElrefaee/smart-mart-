part of 'save_search_cubit.dart';

@immutable
sealed class SaveSearchState {}

final class SaveSearchInitial extends SaveSearchState {}
class SearchRecent extends SaveSearchState {
  final List<String> recentSearches;
  SearchRecent(this.recentSearches);
}