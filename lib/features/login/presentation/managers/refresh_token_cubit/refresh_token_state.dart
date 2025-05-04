import 'package:equatable/equatable.dart';

abstract class RefreshTokenState extends Equatable {
  const RefreshTokenState();

  @override
  List<Object> get props => [];
}

class RefreshTokenInitial extends RefreshTokenState {}

class RefreshTokenLoading extends RefreshTokenState {}

class RefreshTokenSuccess extends RefreshTokenState {
  final String newAccessToken;

  const RefreshTokenSuccess(this.newAccessToken);

  @override
  List<Object> get props => [newAccessToken];
}

class RefreshTokenFailure extends RefreshTokenState {
  final String error;

  const RefreshTokenFailure(this.error);

  @override
  List<Object> get props => [error];
}
