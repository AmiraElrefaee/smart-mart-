import '../../../../core/network/api_service.dart';

class OtpRegisterRemoteDataSourceDio {
  final ApiService apiService;

  OtpRegisterRemoteDataSourceDio(this.apiService);

  Future<Map<String, dynamic>> verifyOtp(String otp) async {
    try {
      final response = await apiService.dio.post(
        '/users/verify',
        data: {
          "verificationCode": otp,
        },
      );

      print("✅ OTP Otp SignUp Remote Data Source Dio Response : ${response.data}");
      return response.data;
    } catch (e) {
      print("❌ Error in Otp SignUp Remote Data Source Dio verifyOtp: $e");
      rethrow;
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
