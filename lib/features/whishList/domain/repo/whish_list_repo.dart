import 'package:smart_mart/core/domain/entities/item_model.dart';

abstract class WishlistRepo {
  Future<void> addToWishlist( String productId);
  Future<bool> removeFromWishlist( String productId);
  Future<List<ItemModel>> fetchWishlistIds();
}
