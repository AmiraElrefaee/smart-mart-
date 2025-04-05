import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/repo/OTP_sign_up_repo.dart';

part 'otp_sign_up_state.dart';

class OtpSignUpCubit extends Cubit<OtpSignUpState> {
  OtpSignUpCubit(this.otpSignUpRepo) : super(OtpSignUpInitial());
  final OtpSignUpRepo otpSignUpRepo ;

  Future<void> OtpSignUp
      ({ required String OTP,})
  async{
    emit(OtpSignUpLoading());
    try{
      final response = await otpSignUpRepo.OTPSignUp(OTP);
      print('📌 Decoded Response: $response');

      if (response["status"] == "success") {
        print('✅ Success! Emitting RegisterSuccess...');
        emit(OtpSignUpSuccess());
      } else {
        print('❌ Registration failed: ${response["message"]}');
        emit(OtpSignUpFailure(response["message"] ?? "Unknown error"));
      }
    }
    catch(error){

      print('⚠️ here cubit error: $error');
      emit(OtpSignUpFailure(error.toString()));
    }
  }
}
