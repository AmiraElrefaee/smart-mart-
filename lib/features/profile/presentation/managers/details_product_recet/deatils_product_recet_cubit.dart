import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models.dart';

part 'deatils_product_recet_state.dart';

class DeatilsProductRecetCubit extends Cubit<DeatilsProductRecetState> {
  DeatilsProductRecetCubit() : super(DeatilsProductRecetInitial());
  Future<void>fetchProducts({required OrderModel order})async{
    try {
      print('fetchProducts is going  ');
      // emit(SubCategoryLoading());
      emit(DeatilsProductRecetLoading());


      print('the products is $order');
      emit(DeatilsProductRecetSuccess(order));

    } catch (e) {
      print('SubCategoryCubit fetchBestSellers error ${e.toString()}  ');

      emit(DeatilsProductFail());
    }
  }
}
