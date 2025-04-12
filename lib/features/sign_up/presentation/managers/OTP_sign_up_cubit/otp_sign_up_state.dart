part of 'otp_sign_up_cubit.dart';

@immutable
sealed class OtpSignUpState {}

final class OtpSignUpInitial extends OtpSignUpState {}
final class OtpSignUpLoading extends OtpSignUpState {}
final class OtpSignUpSuccess extends OtpSignUpState {
  // final String response;
  //
  // RegisterSuccess(this.response);

}
final class OtpSignUpFailure extends OtpSignUpState {
  final String errorMess;

  OtpSignUpFailure(this.errorMess);

}
class ResendOtpLoading extends OtpSignUpState {}
class ResendOtpSuccess extends OtpSignUpState {}
class ResendOtpFailure extends OtpSignUpState {
  final String error;
  ResendOtpFailure(this.error);
}