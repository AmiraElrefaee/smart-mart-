import 'dart:convert';
import 'package:smart_mart/core/domain/entities/item_model.dart';

import '../../../../const.dart';
import 'package:http/http.dart' as http;

import '../../../category/data/models/sub_category_model.dart';


abstract class FetchSimailarProductRemoteDataSource {

  Future<List<ItemModel>> FetchProducts({required String id});
}

class FetchSimailarProductRemoteDataSourceImple implements FetchSimailarProductRemoteDataSource {

  @override
  Future<List<ItemModel>> FetchProducts({required String id}) async {
    try {
      final response = await http.get(Uri.parse('${ApiConstants.baseUrl}/products/$id/recommendations'));

      if (response.statusCode == 200) {
        print('yesss2');
        // استخراج بيانات bestSeller وتحويلها إلى موديل BestSeller
        List data = jsonDecode(response.body)['recommendations'];
        print('yesss3');
        return data.map((e) => BestSeller.fromJson(e)).toList();
      } else {
        print('Request failed  FetchSimailarProductRemoteDataSourceImple'
            '  getRemoteProducts  with status: ${response.statusCode}');
        throw Exception('Failed to load best sellers');
      }
    } catch (e) {
      print('Error in FetchSimailarProductRemoteDataSourceImple  getRemoteProducts: $e');
      throw Exception('Error fetching getRemoteProducts: $e');
    }
  }
}
