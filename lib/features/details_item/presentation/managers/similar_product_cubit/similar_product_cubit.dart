import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_mart/core/domain/entities/item_model.dart';

import '../../../domain/repo/repo_similar_produc.dart';

part 'similar_product_state.dart';

class SimilarProductCubit extends Cubit<SimilarProductState> {
  SimilarProductCubit(this.repoSimilarProduc) : super(SimilarProductInitial());
  final RepoSimilarProduc repoSimilarProduc;

  Future<void>fetchSimilarProducts({required String id})async{
    try {
      print('fetchProducts is going  ');
      emit(SimilarProductLoading());
      final products = await repoSimilarProduc.FetchProduct(id: id);
      print('the products is $products');
      emit(SimilarProductSuccess(products ));
    } catch (e) {
      print('SubCategoryCubit fetchBestSellers error ${e.toString()}  ');
      emit(SimilarProductFailuer());
    }
  }
}
