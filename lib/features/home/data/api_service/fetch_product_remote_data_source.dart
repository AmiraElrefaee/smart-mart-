import 'dart:convert';
import 'package:smart_mart/core/domain/entities/item_model.dart';

import '../../../../const.dart';
import 'package:http/http.dart' as http;

import '../../../category/data/models/sub_category_model.dart';


abstract class FetchProductRemoteDataSource {

  Future<List<ItemModel>> getRemoteProducts();
}

class FetchProductRemoteDataSourceImple implements FetchProductRemoteDataSource {

  @override
  Future<List<ItemModel>> getRemoteProducts() async {
    try {
      final response = await http.get(Uri.parse('${ApiConstants.baseUrl}/product'));

      if (response.statusCode == 200) {
        print('yesss2');
        // استخراج بيانات bestSeller وتحويلها إلى موديل BestSeller
        List dataBestSellers = jsonDecode(response.body)['data'];
        print('yesss3');
        return dataBestSellers.map((e) => BestSeller.fromJson(e)).toList();
      } else {
        print('Request failed  FetchProductRemoteDataSourceImple  getRemoteProducts  with status: ${response.statusCode}');
        throw Exception('Failed to load best sellers');
      }
    } catch (e) {
      print('Error in FetchProductRemoteDataSourceImple  getRemoteProducts: $e');
      throw Exception('Error fetching getRemoteProducts: $e');
    }
  }
}
