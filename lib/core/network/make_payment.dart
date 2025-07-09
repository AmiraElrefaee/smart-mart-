import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:smart_mart/const.dart';
import 'package:smart_mart/core/network/socket_service.dart';
import 'package:smart_mart/core/network/token_storage.dart';

Future<void> makePayment({required String totalamount, required num amount }) async {

  try {
    final token = await TokenStorage.getAccessToken();
    final decodedToken = JwtDecoder.decode(token!);
    final socketService = SocketService(); // خذ النسخة
    final cartId = socketService.cartId2;
    final socketId = socketService.socketId;
    // ApiConstants.firstName =_decodedToken!['firstName'];
    // await TokenStorage.saveTokens(user.token, user.refreshToken);
    String userId = decodedToken!['_id']; // هنا طلعنا ال id
    // 1. استدعي الـ API بتاع السيرفر وابعتي البيانات
    print("userId: $userId");
    print("cartId: $cartId");
    print("socketId: $socketId");
    print("amount: $amount");
    print("totalAmount: $totalamount");

    final response = await Dio().post(
      '${ApiConstants.baseUrl}/payment/create-payment-intent',
      data: {
        "amount": amount,
        "userId": userId,
        "cartId": cartId,
        "socketId": socketId
      },
    );

    final clientSecret = response.data['data']['clientSecret'];

    print('the respone is ${response}');
    // 2. ابدأي الـ PaymentSheet
    // await Stripe.instance.initPaymentSheet(
    //   paymentSheetParameters: SetupPaymentSheetParameters(
    //     paymentIntentClientSecret: clientSecret,
    //     merchantDisplayName: 'Smart Mart',
    //     style: ThemeMode.light,
    //   ),
    // );
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: clientSecret,
        merchantDisplayName: 'Smart Mart 🛒', // اسم يظهر في الأعلى
        style: ThemeMode.dark, // أو ThemeMode.light
        appearance: PaymentSheetAppearance(
          colors: PaymentSheetAppearanceColors(
            background: Colors.white,
            primary:kColor,
            componentBackground: Color(0xffF8F8F8),
            componentBorder: Color(0xffD9D9D9),
            componentDivider: Color(0xffD9D9D9),
            primaryText: Colors.black,
            secondaryText: Color(0x99000000),
            placeholderText: Colors.grey.shade500,
            icon: kColor,
          ),
          shapes: PaymentSheetShape(
            borderRadius: 10,
            // shadow: PaymentSheetShadowParams(color: Colors.black),
          ),
          primaryButton: PaymentSheetPrimaryButtonAppearance(
            colors: PaymentSheetPrimaryButtonTheme(
              light: PaymentSheetPrimaryButtonThemeColors(
                background: kColor,
                text: Colors.white,

              ),
              dark: PaymentSheetPrimaryButtonThemeColors(
                background: kColor,
                text: Colors.white,
                border: kColor,
              ),
            ),
          ),
        ),
      ),
    );

    print("🎯 Showing Payment Sheet now...");

    try {
      await Stripe.instance.presentPaymentSheet();
      print("✅ Payment done successfully");

        SocketService().emitStopCartScanning();
        SocketService().emitClearData();


    } on StripeException catch (e) {
      print("❌ Stripe Exception: ${e.error.localizedMessage}");
    } catch (e) {
      print("❌ General error when presenting payment sheet: $e");
    }


    // 4. لو العملية تمت
    print("✅ Payment done successfully");
  }on DioException catch (e) {
    print("❌ Error during payment: ${e.response?.statusCode}");
    print("❌ Response body: ${e.response?.data}");
    print("❌ Dio error: $e");
  }
}
