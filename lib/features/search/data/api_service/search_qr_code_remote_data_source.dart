import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:smart_mart/const.dart';
import 'package:smart_mart/core/domain/entities/item_model.dart';
import 'package:smart_mart/core/network/api_service.dart';
import 'package:smart_mart/features/category/data/models/sub_category_model.dart';

abstract class SearchQrCodeRemoteDataSource{
  Future <ItemModel> fetchProduct({required String Qrcode});
}

class SearchQrCodeRemoteDataSourceImple implements SearchQrCodeRemoteDataSource{

  @override
  Future<ItemModel> fetchProduct({required String Qrcode})async {

    try{
      print('$Qrcode');
      final response =
      await http.get(Uri.parse('${ApiConstants.baseUrl}/product/barcode/6801577de3f3a3034148f8ea'));
      if ( jsonDecode(response.body)['success'] == true) {
        print('yesss0');
        print(response.body);
        final  dataSubCategory = jsonDecode(response.body)['data'];
        print('yesss1');
        print('the data is ${dataSubCategory}');
        return   BestSeller.fromJson(dataSubCategory);
      } else {
        print(' SearchQrCodeRemoteDataSourceImple Request failed with status: ${response.statusCode}');
        throw Exception('Failed to load subcategories');
      }

    }
    catch(e){
      throw Exception('Error fetching SearchQrCodeRemoteDataSourceImple: $e');
    }
  }

}