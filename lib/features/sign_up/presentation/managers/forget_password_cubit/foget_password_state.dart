part of 'foget_password_cubit.dart';

@immutable
sealed class FogetPasswordState {}

final class FogetPasswordInitial extends FogetPasswordState {}

final class senEmailLoading extends FogetPasswordState {}
final class senEmailSuccess extends FogetPasswordState {
  // final String response;
  //
  // RegisterSuccess(this.response);

}
final class senEmailFailure extends FogetPasswordState {
  final String errorMess;

  senEmailFailure(this.errorMess);

}


class ResendOtpLoading extends FogetPasswordState {}
class ResendOtpSuccess extends FogetPasswordState {}
class ResendOtpFailure extends FogetPasswordState {
  final String error;
  ResendOtpFailure(this.error);
}

class resetPasswordLoading extends FogetPasswordState {}
class resetPasswordSuccess extends FogetPasswordState {}
class resetPasswordFailure extends FogetPasswordState {
  final String error;
  resetPasswordFailure(this.error);
}

class OtpForgetPasswordLoading extends FogetPasswordState {}
class OtpForgetPasswordSuccess extends FogetPasswordState {}
class OtpForgetPasswordFailure extends FogetPasswordState {
  final String error;
  OtpForgetPasswordFailure(this.error);
}