import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import '../../../../../core/domain/entities/item_model.dart';
import '../../../domain/repo/whish_list_repo.dart';

part 'whish_list_state.dart';

class WhishListCubit extends Cubit<WhishListState> {
  final WishlistRepo wishlistRepo;

  WhishListCubit(this.wishlistRepo) : super(WhishListInitial()) {
    // تحميل القائمة عند الإنشاء
    // ShowWhishList();
  }


  Set<String> wishlistIds = {};

  Future<void> addToWhishList({required String idItem}) async {
    if (wishlistIds.contains(idItem)) return;
    emit(WhishListLoading());
    // wishlistIds.add(idItem); // التغيير الفوري في الـ UI
    // emit(AddToWhishList());
    try {
      wishlistIds.add(idItem);
      emit(AddToWhishList());
      await wishlistRepo.addToWishlist(idItem);
      final updatedItems = await wishlistRepo.fetchWishlistIds();
      wishlistIds = updatedItems.map((e) => e.id!).toSet();

      emit(GetWhishListItem(updatedItems));
    } catch (e) {
      wishlistIds.remove(idItem);
      emit(WhishListError('Failed to add item'));
      ShowWhishList();
     // لو حصل خطأ رجعي الخطوة
      wishlistIds.remove(idItem);
      emit(RemoveFromWhishList());
    }
  }
//---------------------------------------------

  Future<void> removeFromWhishList({required String idItem}) async {
    if (!wishlistIds.contains(idItem)) return;

    // شيل المنتج من الـ set
    wishlistIds.remove(idItem);

    // لو الحالة الحالية فيها منتجات، شيل المنتج منها مباشرة
    final List<ItemModel> currentItems = (state is GetWhishListItem)
        ? List<ItemModel>.from((state as GetWhishListItem).items)
        : [];

    final updatedItems = currentItems.where((e) => e.id != idItem).toList();

    // ابعت الـ state المحدث
    emit(GetWhishListItem(updatedItems));

    try {
      // ابعت طلب الحذف للـ API
      await wishlistRepo.removeFromWishlist(idItem);
    } catch (e) {
      // لو حصل فشل، رجع المنتج
      wishlistIds.add(idItem);
      emit(WhishListError('فشل في إزالة العنصر من المفضلة'));
      emit(GetWhishListItem(currentItems));
    }
  }

//--------------
  Future<void> ShowWhishList() async {
    emit(WhishListLoading());

    try {
      List<ItemModel> items = await wishlistRepo.fetchWishlistIds();
      wishlistIds = items.map((e) => e.id!).toSet();
      emit(GetWhishListItem(items));
    } catch (e) {
      emit(WhishListError(e.toString()));
    }
    List<ItemModel> items = await wishlistRepo.fetchWishlistIds();
    wishlistIds = items.map((e) => e.id!).toSet();
    print('the whis list in is in whish list $wishlistIds');
    emit(GetWhishListItem(items)); // لاحظ الحرف الكبير في الاسم
  }

//---------------------------------------------------------
  bool isInWishlist(String id) {
    print('the whis list in is in whish list $wishlistIds');
    return wishlistIds.contains(id);
  }
}
