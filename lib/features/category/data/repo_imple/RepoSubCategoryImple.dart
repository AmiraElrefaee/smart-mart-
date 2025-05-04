
import '../../dmain/repo/repo_sub_category.dart';

import '../api_service/sub_category_by_id_remote_data_source.dart';

import '../models/sub_category_model.dart';

class SubCategoryRepositoryImpl implements RepoSubCategory {
  final SubCategoryByIdRemoteDataSource remoteDataSource;

  SubCategoryRepositoryImpl({
    required this.remoteDataSource,

  });

  @override
  Future<List<SubCategoryModel>> getSubCategories({required String id}) async {
    // تحقق من الاتصال بالإنترنت

      try {
        print(' done in SubCategoryRepositoryImpl getSubCategories');
        return await remoteDataSource.getRemoteSubCategories(id: id);
      } catch (e) {
        print('Error in  SubCategoryRepositoryImpl getSubCategories: $e');
        throw Exception(); // استثناء في حالة حدوث خطأ في السيرفر
      }

  }

  @override
  Future<List<BestSeller>> getBestSellers({required String id}) async {
    // تحقق من الاتصال بالإنترنت

      try {
        print(' done in SubCategoryRepositoryImpl getBestSalle');
        return await remoteDataSource.getRemoteBestSellers(id: id);
      } catch (e) {
        print('Error in  SubCategoryRepositoryImpl getBestSellers: $e');
        throw Exception(); // استثناء في حالة حدوث خطأ في السيرفر
      }
  }
}
