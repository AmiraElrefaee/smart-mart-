import 'package:smart_mart/core/domain/entities/item_model.dart';
import 'package:smart_mart/features/category/dmain/entity/categoty_entity.dart';

import '../../data/models/category_model.dart';
import '../../data/models/sub_category_model.dart';

abstract class RepoProductSubCategory{

  Future<List<ItemModel>> fetchProduct({required String id});
}