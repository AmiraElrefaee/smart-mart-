import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:smart_mart/features/login/domain/entity/login_entity.dart';

import '../../../../const.dart';
class LoginRemoteDataSource{

  final url=Uri.parse('${ApiConstants.baseUrl}/sessions');

  Future<Token> login(String email, String password)async{
    final response = await http.post(
        url,
      body: json.encode({'email': email, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );
    print("✅ Raw Response Body: ${response.body}");

    final responseData = jsonDecode(response.body); // تحويل إلى JSON

    if (responseData['status'] == "success") {
      print('5555522');
      return Token(token: responseData['accessToken']);
    } else{
      print('33333322');
      print(responseData["message"]);
      throw Exception(responseData["message"] ?? "Unknown error");
    }
  }

}