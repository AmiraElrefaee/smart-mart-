
import 'package:smart_mart/core/domain/entities/item_model.dart';

import '../../dmain/repo/repo_product_sub_category.dart';
import '../../dmain/repo/repo_sub_category.dart';

import '../api_service/product_sub_category_remote_data_source.dart';
import '../api_service/sub_category_by_id_remote_data_source.dart';

import '../models/sub_category_model.dart';

class RepoImpleProductSubCategory implements RepoProductSubCategory {
  final ProductSubCategory productSubCategory;

  RepoImpleProductSubCategory({
    required this.productSubCategory,});

  @override
  Future<List<ItemModel>> fetchProduct({required String id}) async {
    try {
      print(' done in fetchProductSubCategory ');
      return await productSubCategory.fetchProduct( idSubCategory: id);
    } catch (e) {
      print('Error in  fetchProductSubCategory : $e');
      throw Exception(); // استثناء في حالة حدوث خطأ في السيرفر
    }
  }
}
