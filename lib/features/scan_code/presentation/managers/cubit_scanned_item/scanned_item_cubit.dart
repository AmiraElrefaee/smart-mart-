import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/repo_imple/repo_imple_sacnned_item.dart';
import '../../../domain2/entity/entity_scanned_item.dart';

part 'scanned_item_state.dart';

class ScannedItemCubit extends Cubit<ScannedItemState> {
  ScannedItemCubit(this.productRepository) : super(ScannedItemInitial());
  final ScannedItemRepoImple productRepository;
  void fetchProduct()async{
    emit(ScannedItemLoading());
    productRepository.getProduct().listen(
        (product){
          emit(ScannedItemSuccess(product));
        },
      onError: (e){
          print('the error in scanned item cubit ${e}');
          emit(ScannedItemError(e.toString()));
      }

    );
  }
}
