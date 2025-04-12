abstract class OtpSignUpRepo{
  Future <Map<String, dynamic>>OTPSignUp(String OTP);
  Future<Map<String, dynamic>> resendVerificationCode();
}