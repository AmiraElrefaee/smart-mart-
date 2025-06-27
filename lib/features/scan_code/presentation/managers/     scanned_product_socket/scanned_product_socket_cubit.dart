import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/domain/entities/error_model.dart';
import '../../../../../core/domain/entities/scanned_product_model.dart';
import '../../../../../core/network/socket_service.dart';
// import '../../../domain/entities/scanned_product_model.dart';

part 'scanned_product_socket_state.dart';

class ScannedProductSocketCubit extends Cubit<ScannedProductSocketState> {
  ScannedProductSocketCubit() : super(ScannedProductSocketInitial()) {
    initSocketListener();
  }
  final List<Product> _products = []; // نقل القائمة إلى مستوى الكيوبت
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  void initSocketListener() {
    SocketService().onProductsReceived = (Product product) {
      print('✅✅✅✅✅✅✅✅✅✅ the product in cubitttt ${product.title}');
      final existingIndex = _products.indexWhere((p) => p.id == product.id);

      if (product.quantity == 0) {
        // حذف المنتج لو الكمية صفر
        if (existingIndex != -1) {
          final removedProduct = _products.removeAt(existingIndex);
          _listKey.currentState?.removeItem(
            existingIndex,
                (context, animation) => SizeTransition(
              sizeFactor: animation,
              child: SizedBox(), // ممكن تعرضي المنتج المحذوف هنا
            ),
          );
          emit(ScannedProductsLoaded(_products, _listKey));
        }
        return; // ما نضيف المنتج
      }

      if (existingIndex != -1) {
        // حذف المنتج القديم لأن فيه نسخة جديدة
        final removedProduct = _products.removeAt(existingIndex);
        _listKey.currentState?.removeItem(
          existingIndex,
              (context, animation) => SizeTransition(
            sizeFactor: animation,
            child: SizedBox(), // ممكن تضيفي الشكل القديم هنا لو حابة
          ),
        );
      }

      SocketService().addProduct(product);

      _products.add(product);
      _listKey.currentState?.insertItem(_products.length - 1); // إضافة المنتج لليست
      emit(ScannedProductsLoaded(_products, _listKey));
      print('✅✅✅✅✅✅✅✅✅✅ the product in cubitttt ${product.price}');
    };

    SocketService().onCartConnected = ( String message) {
      print('✅✅✅✅✅✅✅✅✅✅ connect to cart  $message');
      // إضافة المنتج لليست
      emit(ScannedCartSucess(message)); // إرسال المنتج الجديد فقط
    };
    SocketService().onScanningStop = ( String message) {
      print('✅✅✅✅✅✅✅✅✅✅ connect to cart  $message');
      // إضافة المنتج لليست
      emit(ScannedProductsStopped(message)); // إرسال المنتج الجديد فقط
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
