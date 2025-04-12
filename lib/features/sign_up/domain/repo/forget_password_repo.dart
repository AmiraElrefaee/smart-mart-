abstract class ForgetPasswordRepo{

  Future <Map<String, dynamic>>sendEmail(String email);
  Future<Map<String, dynamic>> resendOtpForgetPassword();
  Future<Map<String, dynamic>> resetPassword(String email, String pass, String Copass);
  Future<Map<String,dynamic>> OtpForgetPassword(String otp);
}