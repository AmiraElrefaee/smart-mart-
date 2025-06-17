import 'package:smart_mart/core/network/api_service.dart';
import 'package:smart_mart/features/login/domain/entity/login_entity.dart';

import '../../../../core/network/token_storage.dart';

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
      final accessToken = response.data['accessToken'];

      // 🟢 2. refreshToken من الكوكيز
      final uri = Uri.parse('https://faint-ilyse-iot-based-smart-retail-system-897f175c.koyeb.app');
      final cookies = await apiService.cookieJar.loadForRequest(uri);
      final refreshTokenCookie = cookies.firstWhere(
            (cookie) => cookie.name == 'refreshToken',
        orElse: () => throw Exception('Refresh token not found in cookies'),
      );

      final refreshToken = refreshTokenCookie.value;

      // 🟢 3. تخزين الاثنين في Hive
      await TokenStorage.saveTokens(accessToken, refreshToken);


      print('✅ Tokens saved to Hive!');
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
