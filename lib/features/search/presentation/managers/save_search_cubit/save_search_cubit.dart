import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/api_service/saved_search_local_data_source.dart';

part 'save_search_state.dart';

class SaveSearchCubit extends Cubit<SaveSearchState> {
  SaveSearchCubit(this.localStorageService) : super(SaveSearchInitial());
  final SearchLocalStorageService localStorageService;
  Future<void> saveToRecent(String keyword) async {
    await localStorageService.saveSearchItem(keyword);
  }

  Future<void> loadRecentSearch() async {
    print('✅✅✅✅✅✅✅✅✅✅✅✅✅✅');
    final recents = await localStorageService.getRecentSearchItems();
    print('theeee recebtsstt ✅✅✅✅✅✅✅✅✅✅✅✅✅✅ $recents');
    emit(SearchRecent(recents));
  }
  Future<void> clearRecentSearches() async {
    await localStorageService.clearRecentSearches();
    emit(SearchRecent([])); // نرجع ستايت فاضي بعد المسح
  }


}
