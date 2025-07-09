import 'package:shared_preferences/shared_preferences.dart';

class SearchLocalStorageService {
  final SharedPreferences prefs;

  SearchLocalStorageService(this.prefs);

  static const _recentKey = 'recent_search_keywords';

  Future<void> saveSearchItem(String keyword) async {
    print('1🔵🔵 function called');

    final List<String> existing = prefs.getStringList(_recentKey) ?? [];
    print('2🔵🔵 function called');

    existing.remove(keyword);
    existing.insert(0, keyword);

    final updated = existing.take(10).toList();
    await prefs.setStringList(_recentKey, updated);
    print('6🔵🔵 function called');
  }

  Future<List<String>> getRecentSearchItems() async {
    final recent = prefs.getStringList(_recentKey);
    print('✅✅✅✅✅✅✅✅✅✅✅✅✅✅ $recent');
    return recent ?? [];
  }

  Future<void> clearRecentSearches() async {
    await prefs.remove(_recentKey);
    print('🗑️ All recent searches cleared.');
  }

}
