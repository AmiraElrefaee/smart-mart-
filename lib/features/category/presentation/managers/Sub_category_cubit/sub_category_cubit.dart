import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/models/sub_category_model.dart';
import '../../../dmain/repo/repo_sub_category.dart';


part 'sub_category_state.dart';

class SubCategoryCubit extends Cubit<SubCategoryState> {
  final RepoSubCategory repoSubCategory;

  SubCategoryCubit({required this.repoSubCategory}) : super(SubCategoryInitial());

  // Method to fetch subcategories by id
  Future<void> fetchSubCategories({ required String id}) async {
    try {
      emit(SubCategoryLoading());
      print('SubCategoryCubit fetchSubCategories donnne  ');
      // final subCategories = await repoSubCategory.getSubCategories(id: id);
      final subCategories = await repoSubCategory.getSubCategories(id: id);
      final bestSellers = await repoSubCategory.getBestSellers(id: id);
      emit(SubCategorySucess(subCategories: subCategories,
      bestSellers: bestSellers
      ));
    } catch (e) {
      print('SubCategoryCubit fetchSubCategories error ${e.toString()}  ');
      emit(SubCategoryError(message: e.toString()));
    }
  }

  // Method to fetch best sellers by id
  Future<void> fetchBestSellers({ required String id}) async {
    try {
      print('SubCategoryCubit fetchBestSellers donnne  ');
      emit(SubCategoryLoading());
      final bestSellers = await repoSubCategory.getBestSellers(id: id);
      emit(SubCategoryBestSellerSucess(bestSellers: bestSellers));
    } catch (e) {
      print('SubCategoryCubit fetchBestSellers error ${e.toString()}  ');
      emit(SubCategoryError(message: e.toString()));
    }
  }
}
