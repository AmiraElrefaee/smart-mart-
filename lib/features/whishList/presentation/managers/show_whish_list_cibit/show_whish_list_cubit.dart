import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/domain/entities/item_model.dart';
import '../../../domain/repo/whish_list_repo.dart';

part 'show_whish_list_state.dart';

class ShowWhishListCubit extends Cubit<ShowWhishListState> {
  ShowWhishListCubit(this.wishlistRepo) : super(ShowWhishListInitial());

  final WishlistRepo wishlistRepo;
  Future<void> ShowWhishList() async {
    // emit(WhishListLoading());

    try {
      List<ItemModel> items = await wishlistRepo.fetchWishlistIds();
      // wishlistIds = items.map((e) => e.id!).toSet();
      emit(GetWhishListItem(items));
    } catch (e) {
      print('the error ${e.toString()}');
      emit(WhishListError(e.toString()));
    }
    // List<ItemModel> items = await wishlistRepo.fetchWishlistIds();
    // wishlistIds = items.map((e) => e.id!).toSet();
    // print('the whis list in is in whish list $wishlistIds');
    // emit(GetWhishListItem(items)); // لاحظ الحرف الكبير في الاسم
  }
}
