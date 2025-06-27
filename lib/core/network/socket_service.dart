import 'package:dio/dio.dart';
import 'package:smart_mart/core/network/token_storage.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../const.dart';
import '../domain/entities/error_model.dart';
import '../domain/entities/scanned_product_model.dart';


class SocketService {
  static final SocketService _instance = SocketService._internal();
  late IO.Socket socket;
  Function(Product)? onProductsReceived;
  Function(ErrorModel)? onErrorReceived;
  Function( String message)? onCartConnected;
  Function( String message)? onScanningStop;


  final List<Product> _products = [];

  List<Product> get products => List.unmodifiable(_products); // read-only version
  factory SocketService() {
    return _instance;
  }

  SocketService._internal();
  bool _isConnected = false;
  bool get isConnected => _isConnected;
  void connect() async {
    final token = await TokenStorage.getAccessToken();
    print('🔁🔁🔁 ❌❌the token is $token');

    // socket = IO.io("https://faint-ilyse-iot-based-smart-retail-system-897f175c.koyeb.app", <String, dynamic>{
    //   // 'transports': ['websocket'],
    //   'auth': {
    //     'token': token, // Add Bearer prefix
    //   },
    //   // 'connectTimeout': 10000,
    // });
    socket = IO.io(
      'https://faint-ilyse-iot-based-smart-retail-system-897f175c.koyeb.app'+'/cart',
      IO.OptionBuilder()
          .setTransports(['websocket']) // مهم جدًا
          .enableAutoConnect() // يفضل تفعيله
          .setAuth({'token': token}) // إرسال التوكن حسب الباك
          .build(),
    );

    socket.connect();

    socket.onConnect((_) {
      print('✅ Connected to Socket Server');
      _isConnected = true;
    });
    socket.onConnectError((data) async {
      print('🔁 Connect Error: $data');
      print('🔁  🔁🔁🔁🔁🔁🔁🔁🔁Try refreshing token...');
      if (data['message']==' Invalid token'){
        _tryRefreshTokenAndReconnect();
      };
      // await _tryRefreshTokenAndReconnect();
    });

    socket.onDisconnect((_) {
      print('❌ Disconnected from Socket Server');
      _isConnected =false;


    });

    // socket.onError((data) {
    //   print('❗ Socket Error: $data');
    //   if (data['message']=='Invalid token'){
    //     _tryRefreshTokenAndReconnect();
    //   };
    // });
    //---------------------

    //----------
    socket.on('products-update', (data) {
      print('📥📥📥📥📥📥 Received data type: ${data.runtimeType}');
      print('📥📥📥📥📥📥 Received products-update: $data');
      try {
        final productJson = data['product'];
        if (productJson == null) throw 'product field is null';
        print('📥📥📥📥📥📥 Received products-update: $productJson');

        final product = Product.fromJson(productJson);
        print('📥📥📥📥📥📥 Received products-update222222: ${product.itemWeight}');
        onProductsReceived?.call(product);
        print('✅✅✅✅✅✅✅ Parsed product: ${product.title}');
      } catch (e) {
        print('❌❌❌❌❌ Error parsing products: $e');
      }
    });

    socket.on('error', (data) {
      print('❌❌❌❌❌❌❌❌❌ Socket Error Received: $data');
      if (data['message']==' Invalid token'){
        _tryRefreshTokenAndReconnect();
      };
      if (data is Map && data.containsKey('code') && data.containsKey('message')) {
        final errorCode = data['code'];
        final errorMessage = data['message'];
        final event = data['event'];

        print('🚨❌❌❌❌❌❌ Error Event: $event');
        print('🚨❌❌❌❌ Error Code: $errorCode');
        print('🚨❌❌❌ Error Message: $errorMessage');

        // ممكن تبعتيه لكيوبت أو تتعاملي معاه هنا
        onErrorReceived?.call(ErrorModel(
          event: event,
          code: errorCode,
          message: errorMessage,
        ));
      }
    });


    socket.on('cart-connected', (data) {
      print('🛒🟢 Cart Connected Event Received: $data');
      final success = data['success'];
      final cartQrCode = data['cartQrCode'];
      final message = data['message'];
      if (success == true && cartQrCode != null && message != null) {
        // onCartConnected?.call(cartQrCode, message);
      }

      print('🛒 Cart QR: $cartQrCode, Success: $success, Message: $message');
      // هنا ممكن تخزني cartQrCode أو تعرضي رسالة للمستخدم حسب السيناريو
    });


  socket.on('cart-data-set', (data) {
  print('🛒🟢 Ccart-data-set Event Received: $data');
  final success = data['success'];
  final cartQrCode = data['cartQrCode'];
  final message = data['message'];
  if (success == true ||data.success) {
  onCartConnected?.call(message);
  }

  print('🛒 Cart QR: $cartQrCode, Success: $success, Message: $message');
  // هنا ممكن تخزني cartQrCode أو تعرضي رسالة للمستخدم حسب السيناريو
  });



    socket.on('scanning-stopped', (data) {
      print('🛒🟢 scanning-stopped Event Received: $data');
      final success = data['success'];
      final cartQrCode = data['cartQrCode'];
      final message = data['message'];
      if (success == true ||data.success) {
        onScanningStop?.call(message);

      }

      print('🛒🛒🛒🛒🛒🛒🛒  scanning stoped by you ');
      // هنا ممكن تخزني cartQrCode أو تعرضي رسالة للمستخدم حسب السيناريو
    });


}



//------------refresh token ------------------
  Future<void> _tryRefreshTokenAndReconnect() async {
    final refreshToken = await TokenStorage.getRefreshToken();
    if (refreshToken != null) {
      try {
        final dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));
        final response = await dio.post('/sessions/refresh');
        final newAccessToken = response.data['data']['accessToken'];
        await TokenStorage.saveTokens(newAccessToken, refreshToken);
        await socket.connect();
        print('🟢🟢🟢🟢🟢🟢 sucess  to refresh token: ');
        // إعادة الاتصال بالسوكيت بعد التجديد
      } catch (e) {
        print('❌❌❌❌ Failed to refresh token: $e');
      }
    }
  }

//----------------------- emit ----------------------
  void emitScanCart({required String cartId, required String userId}) {
    socket.emit('set-cart-data', {
      'cartQrCode': "8799",

    });
    print('📤✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅ Emitted scan-cart event: cartId=$cartId, userId=$userId');
  }
  void emitStopCartScanning() {
    socket.emit('stop-cart-scanning');
    print('📤✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅ stop scan event emited');
  }

  // void emitDisconnected() {
    // socket.emit('scan-cart-qr', {
    //   'cartQrCode': "8799",
    //   'userId':userId,
    // });
  //   print('📤✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅ Emitted disconnected: ');
  // }
  // void emitCheckout() {
    // socket.emit('scan-cart-qr', {
    //   'cartQrCode': "8799",
    //   'userId':userId,
    // });
  //   print('📤✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅ Emitted Checkout event: ');
  // }


  void disconnect() {
    socket.disconnect();
  }
  void addProduct(Product product) {
    // لو المنتج موجود مسبقًا، حدثه بدل ما تضيفه مرتين
    final index = _products.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      _products[index] = product;
      print('🔄 Updated existing product in list: ${product.id}');
    } else {
      _products.add(product);
      print('➕ Added new product to list: ${product.id}');
    }
  }

  void removeProduct(String id) {
    _products.removeWhere((product) => product.id == id);
    print('🗑️ Removed product with id: $id');
  }
}
