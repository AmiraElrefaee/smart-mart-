import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:smart_mart/const.dart';

Future<void> initStripeKey() async {
  try {
    final response = await Dio().get('${ApiConstants.baseUrl}/payment/config');

    final publicKey = response.data['data']['publicKey'];
    print('📤 Stripe Public Key: $publicKey');

    Stripe.publishableKey = publicKey;
    await Stripe.instance.applySettings();
  } catch (e) {
    print('❌ Failed to initialize Stripe key: $e');
    rethrow;
  }
}
