import 'package:smart_mart/features/sign_up/data/api_service/register_remote_data_source.dart';
import 'package:smart_mart/features/sign_up/domain/repo/register_repo.dart';

import '../../domain/repo/OTP_sign_up_repo.dart';
import '../api_service/OTP_sign_up_remote_data_source.dart';

class OtpSignUpRepoImple implements OtpSignUpRepo{
  final OtpSignUpRemoteDataSource otpSignUpRemoteDataSource;

  OtpSignUpRepoImple(this.otpSignUpRemoteDataSource);
  @override
  Future<Map<String, dynamic>> OTPSignUp
      (String OTP) {
    return otpSignUpRemoteDataSource.OtpSignUP(OTP);
  }

}