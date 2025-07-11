import 'package:smart_mart/core/domain/entities/item_model.dart';
import 'package:smart_mart/features/category/dmain/entity/categoty_entity.dart';

import '../../domain/repo/repo_recet_product.dart';
import '../api_service/fectch_product_recet_remote_data_source.dart';
import '../models.dart';



class RepoImpleRecetProducts implements RepoRecetProduct{
  final  OrderRemoteDataSource orderRemoteDataSource;

  RepoImpleRecetProducts(this.orderRemoteDataSource);
  @override
  Future<List<OrderModel>> FetchProduct()async {
    try{
      print('repo imple done');
      final List<OrderModel> data = await orderRemoteDataSource.fetchOrders();
      return data;
    }
    catch(e){
      print('repo RepoCategoryImple hass error ${e.toString()}');
      throw Exception('repo RepoCategoryImple hass error ${e.toString()}');
    }


  }

}