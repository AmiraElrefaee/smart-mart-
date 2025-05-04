import 'package:smart_mart/features/category/dmain/entity/categoty_entity.dart';

import '../../data/models/category_model.dart';
import '../../data/models/sub_category_model.dart';

abstract class RepoSubCategory{
  Future<List<SubCategoryModel>> getSubCategories({required String id});
  Future<List<BestSeller>> getBestSellers({required String id});
}