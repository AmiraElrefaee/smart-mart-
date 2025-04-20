import 'package:smart_mart/core/network/api_service.dart';

class ForegtPasswordRemoteDataSourceDio{
  final ApiService apiService;

  ForegtPasswordRemoteDataSourceDio(this.apiService);
  Future<Map<String,dynamic>> sendEmail({required String email}) async {
    
    try {
      final response = await apiService.dio.post(
        '/users/forgotpassword',
       data: {
          'email':email
       }
      );
      return response.data;
    } catch (e) {
      print("❌ Error in ForegtPasswordRemoteDataSourceDio registerUser: $e");
      rethrow;
    }
  }


  Future<Map<String, dynamic>> verifyOtp(String otp) async {
    try {
      final response = await apiService.dio.post(
        '/users/VerifyResetCode',
        data: {
          "code": otp,
        },
      );

      print("✅ OTP Otp forget password Remote Data Source Dio Response : ${response.data}");
      return response.data;
    } catch (e) {
      print("❌ Error in Otp  forget password Remote Data Source Dio verifyOtp: $e");
      rethrow;
    }
  }

  Future<Map<String, dynamic>>ResetPassword(String email,String pass, String conPass) async{


    final response =await apiService.dio.post(
        '/users/resetpassword',
      data: {
          'email':email,
        'password':pass,
        'passwordConfirmation':conPass
      }
    );

    print("✅ Raw Response Body: ${response.data}");

    final responseData =response.data; // تحويل إلى JSON

    if (responseData['status'] == "success") {
      print('55555');
      return responseData;
    } else{
      print('333333');
      print(responseData['status']);
      print(responseData['message']);
      throw Exception(responseData["message"] ?? "Unknown error");
    }

  }

  Future<Map<String, dynamic>> resendVerificationCode() async {
    try {
      final response = await apiService.dio.get('/users/resend-verification');
      print("🔄 Resend Code Response: ${response.data}");
      return response.data;
    } catch (e) {
      print("❌ Error in resendVerificationCode: $e");
      rethrow;
    }
  }

}