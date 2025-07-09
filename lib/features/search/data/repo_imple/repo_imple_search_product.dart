
import 'package:smart_mart/core/domain/entities/item_model.dart';

import '../../domain/repo/repo_search_product.dart';
import '../api_service/search_product_remote_data_source.dart';

class RepoImpleSearchProduct implements RepoSearchProduct {
  final SearchProductRemoteDataSource searchProductRemoteDataSource;

  RepoImpleSearchProduct({
    required this.searchProductRemoteDataSource,});

  @override
  Future<List<ItemModel>> getProduct({required String KeyWords}) async {
    try {
      print(' done in RepoImpleSearchProduct ');
      return await searchProductRemoteDataSource.fetchProduct(keyWords: KeyWords);
    } catch (e) {
      print('Error in  RepoImpleSearchProduct : $e');
      throw Exception(); // استثناء في حالة حدوث خطأ في السيرفر
    }
  }
}
