import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_mart/core/domain/entities/item_model.dart';

import '../../../data/models.dart';
import '../../../domain/repo/repo_recet_product.dart';

part 'product_recet_state.dart';

class ProductRecetCubit extends Cubit<ProductRecetState> {
  ProductRecetCubit(this.repoRecetProduct) : super(ProductRecetInitial());
  final RepoRecetProduct repoRecetProduct;
  Future<void>fetchProducts()async{
    try {
      print('fetchProducts is going  ');
      // emit(SubCategoryLoading());
      emit(ProductRecetlaodind());

      final products = await repoRecetProduct.FetchProduct();
      print('the products is $products');
      emit(ProductRecetSuccess(products));

    } catch (e) {
      print('SubCategoryCubit fetchBestSellers error ${e.toString()}  ');

      emit(ProductRecetFail());
    }
  }
}
