import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_mart/core/domain/entities/item_model.dart';

import '../../../domain/repo/repo_product.dart';

part 'fetch_product_state.dart';

class FetchProductCubit extends Cubit<FetchProductState> {
  FetchProductCubit(this.repoProduct) : super(FetchProductInitial());
  final RepoProduct repoProduct;
  Future<void>fetchProducts()async{
    try {
      print('fetchProducts is going  ');
      // emit(SubCategoryLoading());
      emit(FetchProductLoading());

      final products = await repoProduct.FetchProduct();
      emit(FetchProductSucces(products:products ));
    } catch (e) {
      print('SubCategoryCubit fetchBestSellers error ${e.toString()}  ');
      // emit(SubCategoryError(message: e.toString()));
    }
  }
}
