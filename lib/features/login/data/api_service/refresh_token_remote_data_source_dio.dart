import 'package:smart_mart/core/network/api_service.dart';
import 'package:smart_mart/features/login/domain/entity/login_entity.dart';

class RefreshTokenRemoteDataSourceDio {
  final ApiService apiService;

  RefreshTokenRemoteDataSourceDio(this.apiService);

  Future<Token> refreshAccessToken() async {
    try {
      final response = await apiService.dio.post('/sessions/refresh');

      print("✅ in RefreshTokenRemoteDataSourceDio Response: ${response.data}");

      final responseData = response.data;

      if (responseData['status'] == "success") {
        final newToken = responseData['data']['accessToken'];
        return Token(token: newToken);
      } else {
        print('⚠️ Refresh Token failed: ${responseData["message"]}');
        throw Exception(responseData["message"] ?? "Unknown error during token refresh");
      }
    } catch (e) {
      print("❌ Error in RefreshTokenRemoteDataSourceDio: $e");
      rethrow;
    }
  }
}
