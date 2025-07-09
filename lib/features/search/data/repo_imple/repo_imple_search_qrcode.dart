
import 'package:smart_mart/core/domain/entities/item_model.dart';

import '../../domain/repo/repo_search_product.dart';
import '../../domain/repo/repo_search_qr_code.dart';
import '../api_service/search_product_remote_data_source.dart';
import '../api_service/search_qr_code_remote_data_source.dart';

class RepoImpleSearchQrcode implements RepoSearchQrCode {
  final SearchQrCodeRemoteDataSource searchQrCodeRemoteDataSource;

  RepoImpleSearchQrcode({
    required this.searchQrCodeRemoteDataSource,});

  @override
  Future<ItemModel> getProduct({required String Qrcode}) async {
    try {
      print(' done in RepoImpleSearchProduct ');
      return await searchQrCodeRemoteDataSource.fetchProduct(Qrcode: Qrcode);
    } catch (e) {
      print('Error in  RepoImpleSearchProduct : $e');
      throw Exception(); // استثناء في حالة حدوث خطأ في السيرفر
    }
  }
}
