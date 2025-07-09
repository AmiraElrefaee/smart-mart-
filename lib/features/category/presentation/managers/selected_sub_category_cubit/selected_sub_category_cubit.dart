import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_mart/features/category/presentation/managers/selected_sub_category_cubit/selected_sub_categoru_state.dart';

class SelectedSubCategoryCubit extends Cubit<SelectedSubCategoryState> {
  SelectedSubCategoryCubit() : super(SubCategoryInitial());

  void select(String id,String name) {
    // لو هو نفس العنصر المختار → الغي التحديد
    if (state is SubCategorySelected && (state as SubCategorySelected).selectedId == id) {
      emit(SubCategoryCleared());
    } else {
      emit(SubCategorySelected(id,name));
    }
  }

  void clear() {
    emit(SubCategoryCleared());
  }
}
