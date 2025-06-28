import 'package:smart_mart/core/domain/entities/item_model.dart';
import 'package:smart_mart/features/category/dmain/entity/categoty_entity.dart';

import '../../domain/repo/repo_product.dart';
import '../api_service/fetch_product_remote_data_source.dart';


class RepoImpleProduct implements RepoProduct{
final  FetchProductRemoteDataSourceImple fetchProductRemoteDataSourceImple;

  RepoImpleProduct(this.fetchProductRemoteDataSourceImple);
  @override
  Future<List<ItemModel>> FetchProduct()async {
    try{
      print('repo imple done');
      final List<ItemModel> data = await fetchProductRemoteDataSourceImple.getRemoteProducts();
      return data;
    }
    catch(e){
      print('repo RepoCategoryImple hass error ${e.toString()}');
      throw Exception('repo RepoCategoryImple hass error ${e.toString()}');
    }


  }

}