import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/domain/entities/error_model.dart';
import '../../../../../core/domain/entities/scanned_product_model.dart';
import '../../../../../core/network/socket_service.dart';
// import '../../../domain/entities/scanned_product_model.dart';

part 'scanned_product_socket_state.dart';

class ScannedProductSocketCubit extends Cubit<ScannedProductSocketState> {
  ScannedProductSocketCubit() : super(ScannedProductSocketInitial()) {
    _initSocketListener();
  }

  void _initSocketListener() {
    SocketService().onProductsReceived = (Product product) {
      print('✅✅✅✅✅✅✅✅✅✅ the product in cubitttt $product');
      SocketService().addProduct(product); // إضافة المنتج لليست
      emit(ScannedProductsLoaded(product));
      print('✅✅✅✅✅✅✅✅✅✅ the product in cubitttt $product');// إرسال المنتج الجديد فقط
    };
    SocketService().onCartConnected = (String cartQrCode, String message) {
      print('✅✅✅✅✅✅✅✅✅✅ connect to cart  $message');
      // إضافة المنتج لليست
      emit(ScannedCartSucess(message)); // إرسال المنتج الجديد فقط
    };

    SocketService().onErrorReceived = (ErrorModel error) {
      switch (error.event) {
        case 'scan-cart-qr':
          emit(ScannedProductsError(error.message));
          break;
      }
    };
  }

  void clearProducts() {
    emit(ScannedProductSocketInitial());
  }
}
