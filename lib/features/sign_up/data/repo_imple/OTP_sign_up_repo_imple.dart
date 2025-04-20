import 'package:smart_mart/features/sign_up/data/api_service/sign_up_remote_data_source.dart';
import 'package:smart_mart/features/sign_up/domain/repo/register_repo.dart';

import '../../domain/repo/OTP_sign_up_repo.dart';
import '../api_service/OTP_register_remote_data_source_dio.dart';
import '../api_service/OTP_sign_up_remote_data_source.dart';

class OtpSignUpRepoImple implements OtpSignUpRepo{
  OtpSignUpRepoImple(this.otpSignUpRemoteDataSource);
  final OtpRegisterRemoteDataSourceDio otpSignUpRemoteDataSource;


  @override
  Future<Map<String, dynamic>> OTPSignUp(String OTP) {
    return otpSignUpRemoteDataSource.verifyOtp(OTP);
  }
  @override
  Future<Map<String, dynamic>> resendVerificationCode() {
    return otpSignUpRemoteDataSource.resendVerificationCode();
  }
}