import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/domain/entities/error_model.dart';
import '../../../../../core/network/socket_service.dart';

part 'socket_error_state.dart';

class SocketErrorCubit extends Cubit<SocketErrorState> {
  SocketErrorCubit() : super(SocketErrorInitial()) {
    _initErrorListener();
  }

  void _initErrorListener() {
    SocketService().onErrorReceived = (ErrorModel error) {
      // هندلة حسب نوع الحدث اللي حصل فيه error
      switch (error.event) {
        case 'scan-cart-qr':
          emit(SocketErrorScanCart(error.message));
          break;
        case 'products-update':
          emit(SocketErrorProductUpdate(error.message));
          break;
        default:
          emit(SocketErrorUnknown(error.message));
      }
    };
  }

  void clearError() {
    emit(SocketErrorInitial());
  }
}
