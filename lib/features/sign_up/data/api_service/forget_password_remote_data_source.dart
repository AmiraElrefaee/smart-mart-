
import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../../../const.dart';

class OtpForgetPasswordRemoteDataSource{

  Future<Map<String, dynamic>>sendEmail(String email) async{
    final url=Uri.parse('${ApiConstants.baseUrl}/users/forgotpassword');

    final response =await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body:json.encode( {
          "email": email
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



  Future<Map<String, dynamic>>ResetPassword(String email,String pass, String conPass) async{
    final url=Uri.parse('${ApiConstants.baseUrl}/users/forgotpassword');

    final response =await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body:json.encode( {
          "email": email,
          "password" : pass,
          "passwordConfirmation" : conPass
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



  Future<Map<String, dynamic>>OtpForgetPassword(String OTP) async{
    final url=Uri.parse('${ApiConstants.baseUrl}/users/VerifyResetCode');

    final response =await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body:json.encode( {
          "code": OTP
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



  Future<Map<String, dynamic>> resendOTPForgetPasswoed() async {
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