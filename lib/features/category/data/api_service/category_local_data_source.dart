import 'package:hive/hive.dart';
import 'package:smart_mart/features/category/dmain/entity/categoty_entity.dart';

import '../models/category_model.dart';

abstract class CategoryLocalDataSource{
    Future<void>  CacheCategories (List<CategoryModel> categories );
    Future<List<CategoryModel>> GetCacheCategories ();

}



class CategoryLocalDataSourceImple implements CategoryLocalDataSource{
  final  Box<CategoryModel>  categoryBox;

  CategoryLocalDataSourceImple(this.categoryBox);
  @override
  Future<void> CacheCategories(List<CategoryModel> categories) async{
    print('hhhh');
   // await categoryBox.close();
   for (var category in categories){
     await categoryBox.put(category.id, category);
   }

  }

  @override
  Future<List<CategoryModel>> GetCacheCategories() async{
    return categoryBox.values.toList(); // نحول كل القيم إلى List
  }
  
}