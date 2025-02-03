part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}
final class LoginLoading extends LoginState {}
final class LoginSuccess extends LoginState {
  final Token token;
  LoginSuccess(this.token);
}
final class LoginFailure extends LoginState {
  final String message;
  LoginFailure(this.message);
}
