

import 'package:smart_mart/core/domain/entities/item_model.dart';

import '../../domain/repo/whish_list_repo.dart';
import '../api_service/whish_list_remote_data_source.dart';

class WishlistRepoImpl extends WishlistRepo {
  final WishlistRemoteDataSource remoteDataSource;
  WishlistRepoImpl(this.remoteDataSource);

  @override
  Future<void> addToWishlist( String productId) {
    return remoteDataSource.addToWishlist( productId);
  }

  @override
  Future<bool> removeFromWishlist(String productId) {
    return remoteDataSource.removeFromWishlist( productId);
  }

  @override
  Future<List<ItemModel>> fetchWishlistIds() {
    return remoteDataSource.fetchWishlistIds();
  }
}
