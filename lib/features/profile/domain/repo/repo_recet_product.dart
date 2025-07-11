import 'package:smart_mart/core/domain/entities/item_model.dart';
import 'package:smart_mart/features/category/dmain/entity/categoty_entity.dart';

import '../../data/models.dart';



abstract class RepoRecetProduct{

  Future<List<OrderModel>> FetchProduct();
}