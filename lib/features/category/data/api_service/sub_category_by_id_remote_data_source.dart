import 'dart:convert';
import '../../../../const.dart';
import 'package:http/http.dart' as http;
import '../models/sub_category_model.dart';

abstract class SubCategoryByIdRemoteDataSource {
  Future<List<SubCategoryModel>> getRemoteSubCategories({required String id});
  Future<List<BestSeller>> getRemoteBestSellers({required String id});
}

class SubCategoryByIdRemoteDataSourceImple implements SubCategoryByIdRemoteDataSource {

  @override
  Future<List<SubCategoryModel>> getRemoteSubCategories({required String id}) async {
    try {
      final response = await http.get(Uri.parse('${ApiConstants.baseUrl}/category/$id'));
      print('${response.body}');

      if ( jsonDecode(response.body)['success'] == true) {
        print('yesss0');
        // استخراج البيانات من الاستجابة وتحويلها إلى موديل
        List dataSubCategory = jsonDecode(response.body)['data']['subCategories'];
        print('yesss1');
        return dataSubCategory.map((e) =>
            SubCategoryModel.fromJson(e)).toList();
      } else {
        print(' SubCategoryByIdRemoteDataSourceImple Request failed with status: ${response.statusCode}');
        throw Exception('Failed to load subcategories');
      }
    } catch (e) {
      print('Error in SubCategoryByIdRemoteDataSourceImple getRemoteSubCategories: $e');
      throw Exception('Error fetching subcategories: $e');
    }
  }

  @override
  Future<List<BestSeller>> getRemoteBestSellers({required String id}) async {
    try {
      final response = await http.get(Uri.parse('${ApiConstants.baseUrl}/category/$id'));

      if (response.statusCode == 200) {
        print('yesss2');
        // استخراج بيانات bestSeller وتحويلها إلى موديل BestSeller
        List dataBestSellers = jsonDecode(response.body)['data']['bestSeller'];
        print('yesss3');
        return dataBestSellers.map((e) => BestSeller.fromJson(e)).toList();
      } else {
        print('Request failed  SubCategoryByIdRemoteDataSourceImple  getRemoteBestSellers with status: ${response.statusCode}');
        throw Exception('Failed to load best sellers');
      }
    } catch (e) {
      print('Error in SubCategoryByIdRemoteDataSourceImple  getRemoteBestSellers: $e');
      throw Exception('Error fetching best sellers: $e');
    }
  }
}
