import '../../../../core/network/api_service.dart';

class RegisterRemoteDataSourceDio {
  final ApiService apiService;

  RegisterRemoteDataSourceDio(this.apiService);

  Future<Map<String, dynamic>> registerUser(String mail,
      String fname,
      String lname,
      String pass,
      String copass,
      num phone ,
      ) async {
    try {
      final response = await apiService.dio.post(
        '/users',
        data: {
          "firstName": fname,
          "lastName": lname,
          "password": pass,
          "passwordConfirmation": copass,
          "email": mail,
          "phoneNumber": "01287564609"
        },
      );

      print("✅ in Register Remote Data Source Register Response: ${response.data}");
      return response.data;
    } catch (e) {

      print("❌ Error in RegisterRemoteDataSource registerUser: $e");
      rethrow;
    }
  }
}
