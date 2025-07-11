import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../../../const.dart';
import '../../../../core/network/token_storage.dart';
import '../models.dart';

abstract class OrderRemoteDataSource {
  Future<List<OrderModel>> fetchOrders();
}

class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {
  @override

  Future<List<OrderModel>> fetchOrders() async {
    final token = await TokenStorage.getAccessToken();
    final decodedToken = JwtDecoder.decode(token!);
    String userId = decodedToken!['_id'];
    final response = await  await http.get(Uri.parse('${ApiConstants.baseUrl}/order/user/$userId'));

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      final data = body['data'] as List;
      return data.map((e) => OrderModel.fromJson(e)).toList();
    } else {
      throw Exception("Failed to fetch orders: ${response.statusCode}");
    }
  }
}
