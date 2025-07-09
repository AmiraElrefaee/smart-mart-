import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/domain/entities/item_model.dart';
import '../../../data/repo_imple/repo_imple_search_product.dart';
import '../../../data/repo_imple/repo_imple_search_qrcode.dart';
import '../../../domain/repo/repo_search_qr_code.dart';

part 'search_qr_code_state.dart';

class SearchQrCodeCubit extends Cubit<SearchQrCodeState> {
  SearchQrCodeCubit(this.repoImpleSearchQrcode) : super(SearchQrCodeInitial());
  final RepoImpleSearchQrcode repoImpleSearchQrcode;

  Future<void>FetchSearchProduct({required String Qrcode})async{
    emit(SearchQrCodeLoading());
    try{
      final ItemModel product= await repoImpleSearchQrcode.getProduct(Qrcode: Qrcode);
      emit(SearchQrCodeSuccess( product));
      print('SearchQrCodeCubit donnne ✅✅✅✅✅✅✅✅✅✅ ');
    }catch(e){
      print('❌❌❌❌❌❌❌❌❌❌there are error when SearchQrCodeCubitproduct $e');
      emit(SearchQrCodeFail());
    }
  }
}
