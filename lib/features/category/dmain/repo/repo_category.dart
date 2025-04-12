import 'package:smart_mart/features/category/dmain/entity/categoty_entity.dart';

import '../../data/models/category_model.dart';

abstract class RepoCategory{
  Future<List<CategoryModel>> getCategories();
}