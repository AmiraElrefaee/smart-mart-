import 'package:smart_mart/core/network/api_service.dart';
import 'package:smart_mart/features/login/domain/entity/login_entity.dart';

class LoginRemoteDataSource {
  final ApiService apiService;

  LoginRemoteDataSource(this.apiService);

  Future<Token> login(String email, String password) async {
    try {
      final response = await apiService.dio.post(
        '/sessions',
        data: {
          'email': email,
          'password': password,
        },
      );

      print("✅ in LoginRemoteDataSourceDio Login Response: ${response.data}");

      final responseData = response.data; // خلاص مش محتاج jsonDecode مع Dio

      if (responseData['status'] == "success") {
        return Token(token: responseData['accessToken']);
      } else {
        print('⚠️ Login failed: ${responseData["message"]}');
        throw Exception(responseData["message"] ?? "Unknown error");
      }
    } catch (e) {
      print("❌ Error in LoginRemoteDataSourceDio login: $e");
      rethrow;
    }
  }
}
