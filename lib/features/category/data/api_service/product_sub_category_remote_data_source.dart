import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:smart_mart/const.dart';
import 'package:smart_mart/core/domain/entities/item_model.dart';
import 'package:smart_mart/core/network/api_service.dart';
import 'package:smart_mart/features/category/data/models/sub_category_model.dart';

abstract class ProductSubCategory{
 Future <List<ItemModel>> fetchProduct({required String idSubCategory});
}

class ProductSubCategoryImple implements ProductSubCategory{

  @override
  Future<List<ItemModel>> fetchProduct({required String idSubCategory})async {

    try{
      print('$idSubCategory');
      final response =
      await http.get(Uri.parse('${ApiConstants.baseUrl}/product/subcategory/$idSubCategory'));
      if ( jsonDecode(response.body)['success'] == true) {
        print('yesss0');
        print(response.body);
        List dataSubCategory = jsonDecode(response.body)['data'];
        print('yesss1');
        print('the data is ${dataSubCategory}');
        return dataSubCategory.map((e) =>
            BestSeller.fromJson(e)).toList();
      } else {
        print(' ProductSubCategoryImple Request failed with status: ${response.statusCode}');
        throw Exception('Failed to load subcategories');
      }

    }
        catch(e){
      throw Exception('Error fetching ProductSubCategoryImple: $e');
        }
  }

}