import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_mart/core/domain/entities/item_model.dart';

import '../../../dmain/repo/repo_product_sub_category.dart';

part 'product_sub_category_state.dart';

class ProductSubCategoryCubit extends Cubit<ProductSubCategoryState> {
  ProductSubCategoryCubit(this.repoProductSubCategory) : super(ProductSubCategoryInitial());
  final RepoProductSubCategory repoProductSubCategory;

  Future<void>FetchProduct({required String name})async{
    emit(ProductSubCategoryLaoding());
    try{
      final List<ItemModel> product= await repoProductSubCategory.fetchProduct(id: name);
      emit(ProductSubCategorySuccess(product: product));
      print('fetched product sub category ');
    }catch(e){
      print('there are error when fetch sub category product $e');
      emit(ProductSubCategoryFail());
    }
  }
}
