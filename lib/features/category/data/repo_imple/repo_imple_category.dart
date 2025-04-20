import 'package:smart_mart/features/category/dmain/entity/categoty_entity.dart';

import '../../dmain/repo/repo_category.dart';
import '../api_service/category_local_data_source.dart';
import '../api_service/category_remote_data_source.dart';
import '../models/category_model.dart';

 class RepoCategoryImple implements RepoCategory{
   final CategoryLocalDataSource categoryLocalDataSource;
   final CategoryRemoteDateSource categoryRemoteDateSource;

  RepoCategoryImple({required this.categoryLocalDataSource,
    required this.categoryRemoteDateSource});
  @override
  Future<List<CategoryModel>> getCategories()async {
    try{
      print('repo imple done');
      final List<CategoryModel> data = await categoryRemoteDateSource.getRemoteCategories();
      await categoryLocalDataSource.CacheCategories(data);
      return await categoryLocalDataSource.GetCacheCategories();
      // print(data[0].image);
      // return data;
    }
    catch(e){
      print('repo imple hass error ');
      return await categoryLocalDataSource.GetCacheCategories();
    }


  }

}