import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:smart_mart/const.dart';
import 'package:smart_mart/core/domain/entities/item_model.dart';
import 'package:smart_mart/core/network/api_service.dart';
import 'package:smart_mart/features/category/data/models/sub_category_model.dart';

abstract class SearchProductRemoteDataSource{
  Future <List<ItemModel>> fetchProduct({required String keyWords});
}

class SearchProductRemoteDataSourceImple implements SearchProductRemoteDataSource{

  @override
  Future<List<ItemModel>> fetchProduct({required String keyWords})async {

    try{
      print('$keyWords');
      final response =
      await http.get(Uri.parse('${ApiConstants.baseUrl}/product/search/$keyWords'));
      if ( jsonDecode(response.body)['success'] == true) {
        print('yesss0');
        print(response.body);
        List dataSubCategory = jsonDecode(response.body)['data'];
        print('yesss1');
        print('the data is ${dataSubCategory}');
        return dataSubCategory.map((e) =>
            BestSeller.fromJson(e)).toList();
      } else {
        print(' SearchProductRemoteDataSourceImple Request failed with status: ${response.statusCode}');
        throw Exception('Failed to load subcategories');
      }

    }
    catch(e){
      throw Exception('Error fetching SearchProductRemoteDataSourceImple: $e');
    }
  }

}