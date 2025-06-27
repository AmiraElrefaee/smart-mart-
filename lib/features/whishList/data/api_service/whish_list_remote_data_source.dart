import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import '../../../../core/domain/entities/item_model.dart';
import '../../../../core/network/api_service.dart';
import '../../../../core/network/token_storage.dart';
import '../../../category/data/models/sub_category_model.dart';

class WishlistRemoteDataSource {
  final ApiService apiService;

  Map<String, dynamic>?decodedToken;
  WishlistRemoteDataSource(this.apiService);

  Future<void> addToWishlist( String productId) async {
    final token = await TokenStorage.getAccessToken();
    decodedToken = JwtDecoder.decode(token!);
    String userId=decodedToken!['_id'];
    String fName=decodedToken!['firstName'];
    String Lname=decodedToken!['lastName'];
    String email=decodedToken!['email'];
    String phone=decodedToken!['phoneNumber'];
    String mesage='message';
    try{
      final response = await apiService.dio.post('/wishlist/$userId/$productId',
      data: {
        "firstName":fName,
        "lastName":Lname,
        "email":email,
        "phone":phone,
        "message":"very amazing website, very powerful api. thanks for the backend"
      },
    );

    print('remove from whish list ${response.data} ');
    }catch(e){
      print('the error in whish list remote data source ${e.toString()}');

    }
  }

  Future<bool> removeFromWishlist( String productId) async {
    final token = await TokenStorage.getAccessToken();
    decodedToken = JwtDecoder.decode(token!);
    String userId=decodedToken!['_id'];
    String fName=decodedToken!['firstName'];
    String Lname=decodedToken!['lastName'];
    String email=decodedToken!['email'];
    String phone=decodedToken!['phoneNumber'];
    String mesage='message';
try{
  final response =await apiService.dio.delete('/wishlist/$userId/$productId',
      data: {
        "firstName":fName,
        "lastName":Lname,
        "email":email,
        "phone":phone,
        "message":"very amazing website, very powerful api. thanks for the backend"
      },
    );
print('remove from whish list ${response.data} ');
return response.data['success'];

}catch(e){
  print('the error in whish list remote data source ${e.toString()}');
  rethrow;
}
  }

  Future<List<ItemModel>> fetchWishlistIds() async {
    final token = await TokenStorage.getAccessToken();
    decodedToken = JwtDecoder.decode(token!);
    String userId=decodedToken!['_id'];
    try {
      final response = await apiService.dio.get('/wishlist/$userId');

    final List<dynamic> rawList = response.data ['wishlist']['products']?? [];
      final List<ItemModel> data = rawList
          .map((json) => BestSeller.fromJson(json))
          .toList();
    return data;
    }
        catch(e){

          print('the error in whish list remote data source fetch in whish list ${e.toString()}');
          rethrow;
        }
      // data.map((e) => e['productId'].toString()).toList(); // حسب الباك
  }
}
