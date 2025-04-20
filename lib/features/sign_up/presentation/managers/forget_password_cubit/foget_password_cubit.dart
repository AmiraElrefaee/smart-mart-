import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/repo/forget_password_repo.dart';

part 'foget_password_state.dart';

class FogetPasswordCubit extends Cubit<FogetPasswordState> {
  FogetPasswordCubit(this.forgetPasswordRepo) : super(FogetPasswordInitial());
  final ForgetPasswordRepo forgetPasswordRepo;
  Future<void> OtpForgetPassword({ required String OTP,}) async{
    emit(OtpForgetPasswordLoading());
    try{
      final response = await forgetPasswordRepo.OtpForgetPassword(OTP);
      print('📌 Decoded Response: $response');

      if (response["message"] == "Code verified successfully") {
        print('✅ Success! Emitting send otp to your mail ...');
        emit(OtpForgetPasswordSuccess());
      } else {
        print('❌ Registration failed: ${response["message"]}');
        emit(OtpForgetPasswordFailure(response["message"] ?? "Unknown error"));
      }
    }
    catch(error){

      print('⚠️ here cubit error OtpForgetPasswordFailure: $error');
      emit(OtpForgetPasswordFailure(error.toString()));
    }
  }

  Future<void> resetPassword({ required String email, required String password
    , required String coPassword,}) async{
    emit(resetPasswordLoading());
    try{
      final response = await forgetPasswordRepo.resetPassword(email,password,coPassword);
      print('📌 Decoded Response: $response');

      if (response["status"] == "success") {
        print('✅ Success! Emitting  resetpassword...');
        emit(resetPasswordSuccess());
      } else {
        print('❌ Registration failed: ${response["message"]}');
        emit(resetPasswordFailure(response["message"] ?? "Unknown error"));
      }
    }
    catch(error){

      print('⚠️ here cubit error: $error');
      emit(resetPasswordFailure(error.toString()));
    }
  }
  Future<void> sendEmail({ required String emial,}) async{
    emit(senEmailLoading());
    try{
      final response = await forgetPasswordRepo.sendEmail(emial);
      print('📌 Decoded Response: $response');

      if (response["status"] == "success") {
        print('✅ Success! Emitting send email ...');
        emit(senEmailSuccess());
      } else {
        print('❌ Registration failed: ${response["message"]}');
        emit(senEmailFailure(response["message"] ?? "Unknown error"));
      }
    }
    catch(error){

      print('⚠️ here cubit error: $error');
      emit(senEmailFailure(error.toString()));
    }
  }

  Future<void> reseOtpForgetPassword() async {
    emit(ResendOtpLoading());
    try {
      final response = await forgetPasswordRepo.resendOtpForgetPassword();
      if (response["status"] == "success") {
        emit(ResendOtpSuccess());
      } else {
        emit(ResendOtpFailure(response["message"] ?? "Unknown error"));
      }
    } catch (error) {
      print('⚠️ resend error: $error');
      emit(ResendOtpFailure(error.toString()));
    }
  }
}
