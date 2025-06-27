import 'dart:convert';

import '../../../../const.dart';
import '../../dmain/entity/categoty_entity.dart';
import 'package:http/http.dart' as http;

import '../models/category_model.dart';
abstract class CategoryRemoteDateSource{
 Future <List<CategoryModel> >getRemoteCategories();
}


class CategoryRemoteDateSourceImple implements CategoryRemoteDateSource{
  @override
  Future<List<CategoryModel>> getRemoteCategories()async {
    print('3333333333');
final response =await http.get(Uri.parse('${ApiConstants.baseUrl}/category'));
if (response.statusCode==200){
  print('done  in CategoryRemoteDateSourceImple');
  List data = jsonDecode(response.body)['data'];
  return data.map((e)=>CategoryModel.fromJson(e)).toList();
}
else {
  print(' not done  in CategoryRemoteDateSourceImple');
  throw Exception('error in category remote data source ');
}
  }

}