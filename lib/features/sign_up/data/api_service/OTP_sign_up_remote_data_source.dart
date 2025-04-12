
import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../../../const.dart';

class OtpSignUpRemoteDataSource{

  Future<Map<String, dynamic>>OtpSignUP
      (String OTP) async{
    final url=Uri.parse('${ApiConstants.baseUrl}/users/verify');

    final response =await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body:json.encode( {
          "verificationCode": OTP
        })
    );

    print("✅ Raw Response Body: ${response.body}");

    final responseData = jsonDecode(response.body); // تحويل إلى JSON

    if (responseData['status'] == "success") {
      print('55555');
      return responseData;
    } else{
      print('333333');
      print(responseData['status']);
      print(responseData['message']);
      throw Exception(responseData["message"] ?? "Unknown error");
    }

  }

  Future<Map<String, dynamic>> resendVerificationCode() async {
    final url = Uri.parse('${ApiConstants.baseUrl}/users/resend-verification');
    final response = await http.get(
      url,
      headers: {'Content-Type': 'application/json'},
    );

    print("🔄 Resend Code Response: ${response.body}");
    final responseData = jsonDecode(response.body);

    if (responseData['status'] == "success") {
      return responseData;
    } else {
      throw Exception(responseData["message"] ?? "Unknown error");
    }
  }
}