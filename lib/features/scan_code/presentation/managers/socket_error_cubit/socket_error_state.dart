part of 'socket_error_cubit.dart';

abstract class SocketErrorState {}

class SocketErrorInitial extends SocketErrorState {}

class SocketErrorScanCart extends SocketErrorState {
  final String message;
  SocketErrorScanCart(this.message);
}

class SocketErrorProductUpdate extends SocketErrorState {
  final String message;
  SocketErrorProductUpdate(this.message);
}

class SocketErrorUnknown extends SocketErrorState {
  final String message;
  SocketErrorUnknown(this.message);
}
