
import 'package:http/http.dart' as http;
import '../../../../const.dart';

class RegisterRmoteDataSource{

Future<String>registerUser
    (String mail, String fname ,String lname, String pass, String copass )
async{
  final url=Uri.parse('${ApiConstants.baseUrl}/register');

  final response =await http.post(url,
    body: {
  "firstName" : fname,
  "lastName" : lname,
  "email" : mail,
  "password" : pass,
  "confirmPassword" : copass
  }
  );

 if (response.statusCode==200){
   return response.body;
 } else{
   throw Exception('Failed to register user');
 }

}
}