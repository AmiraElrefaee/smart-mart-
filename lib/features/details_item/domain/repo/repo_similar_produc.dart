import 'package:smart_mart/core/domain/entities/item_model.dart';
import 'package:smart_mart/features/category/dmain/entity/categoty_entity.dart';



abstract class RepoSimilarProduc{

  Future<List<ItemModel>> FetchProduct({required String id});
}