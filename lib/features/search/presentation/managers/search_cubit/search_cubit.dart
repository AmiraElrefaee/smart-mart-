import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_mart/core/domain/entities/item_model.dart';

import '../../../data/api_service/saved_search_local_data_source.dart';
import '../../../domain/repo/repo_search_product.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.repoSearchProduct) : super(SearchInitial());
  final RepoSearchProduct repoSearchProduct;

  Future<void>FetchSearchProduct({required String keyords})async{
    emit(SearchLoading());
    try{
      final List<ItemModel> product= await repoSearchProduct.getProduct(KeyWords: keyords);
      emit(SearchSuccess( product));
      print('fetched product sub category ');
    }catch(e){
      print('there are error when fetch sub category product $e');
      emit(SearchFailuer());
    }
  }

}
