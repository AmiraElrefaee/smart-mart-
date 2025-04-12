import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/category_model.dart';
import '../../../dmain/entity/categoty_entity.dart';
import '../../../dmain/repo/repo_category.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.repoCategory) : super(CategoryInitial());
  final RepoCategory repoCategory;

  Future<void> fetchCategories() async {
    emit(CategoryLoading());
    print('anyything');
    try {
      final List<CategoryModel> categories = await repoCategory.getCategories();
      print('cubit category done ');
      emit(CategorySuccess(categories));
    } catch (e) {
      print('the error cubit category :${e.toString()} ');
      emit(CategoryFailure(e.toString()));
    }
  }
}
