import 'package:smart_mart/core/domain/entities/item_model.dart';
import 'package:smart_mart/features/category/dmain/entity/categoty_entity.dart';

import '../../domain/repo/repo_similar_produc.dart';
import '../api_servce/fetch_simailar_product_remote_data_source.dart';



class RepoImpleSimilarProduct implements RepoSimilarProduc{
  final  FetchSimailarProductRemoteDataSourceImple  fetchSimailarProductRemoteDataSourceImple;

  RepoImpleSimilarProduct(this.fetchSimailarProductRemoteDataSourceImple);
  @override
  Future<List<ItemModel>> FetchProduct({required String id})async {
    try{
      print(' RepoImpleSimilarProduct done');
      final List<ItemModel> data = await fetchSimailarProductRemoteDataSourceImple.FetchProducts(id: id);
      return data;
    }
    catch(e){
      print('repo RepoImpleSimilarProduct hass error ${e.toString()}');
      throw Exception('repo RepoImpleSimilarProduct hass error ${e.toString()}');
    }


  }

}