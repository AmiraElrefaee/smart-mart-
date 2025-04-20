import '../../domain/repo/forget_password_repo.dart';
import '../api_service/forget_password_remote_data_so9urce_dio.dart';
import '../api_service/forget_password_remote_data_source.dart';

class ForgetPasswordRepoImple implements ForgetPasswordRepo{
  ForgetPasswordRepoImple(this.otpForgetPasswordRemoteDataSource);
  final ForegtPasswordRemoteDataSourceDio otpForgetPasswordRemoteDataSource;


  @override
  Future<Map<String, dynamic>> resendOtpForgetPassword() {
    // TODO: implement resendOtpForgetPassword
   return otpForgetPasswordRemoteDataSource.resendVerificationCode();
  }

  @override
  Future<Map<String, dynamic>> resetPassword(String email, String pass, String Copass) {
    // TODO: implement resetPassword
   return otpForgetPasswordRemoteDataSource.ResetPassword(email, pass, Copass);
  }

  @override
  Future<Map<String, dynamic>> sendEmail(String email) {
    // TODO: implement sendEmail
    return otpForgetPasswordRemoteDataSource.sendEmail(email: email);
  }

  @override
  Future<Map<String, dynamic>> OtpForgetPassword(String otp) {
    // TODO: implement OtpForgetPassword
  return otpForgetPasswordRemoteDataSource.verifyOtp(otp);
  }

}