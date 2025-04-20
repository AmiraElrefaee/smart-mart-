import '../../domain2/repo/scanned_item_repo.dart';
import '../../domain2/entity/entity_scanned_item.dart';
import '../api_service/scanned_item_remote_data_source.dart';

class ScannedItemRepoImple implements ScannedItemRepo {
  final ScannedItemRemoteDataSource remoteDataSource;

  ScannedItemRepoImple(this.remoteDataSource);

  @override
  Stream<List<Product>> getProduct() {
    return remoteDataSource.getProducts();
  }
}
