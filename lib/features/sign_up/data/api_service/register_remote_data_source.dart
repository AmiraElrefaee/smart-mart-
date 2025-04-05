
import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../../../const.dart';

class RegisterRmoteDataSource{

Future<Map<String, dynamic>>registerUser
    (String mail, String fname ,String lname, String pass, String copass )
async{
  final url=Uri.parse('${ApiConstants.baseUrl}/users');

  final response =await http.post(url,
      headers: {'Content-Type': 'application/json'},
    body:json.encode( {
  "firstName" : fname,
  "lastName" : lname,
  "password" : pass,
  "passwordConfirmation" : copass,
      "email" : mail,
      "phoneNumber" : "01557216874"
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
}