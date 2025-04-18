import 'package:smart_mart/features/sign_up/data/api_service/sign_up_remote_data_source.dart';
import 'package:smart_mart/features/sign_up/domain/repo/register_repo.dart';

class RegisterRepoImple implements RegisterRepo{
  final RegisterRmoteDataSource registerRmoteDataSource;

  RegisterRepoImple(this.registerRmoteDataSource);
  @override
  Future<Map<String, dynamic>> register
      (String fname, String lname, String mail, String pass, String copass) {
    return registerRmoteDataSource
        .registerUser(mail, fname, lname, pass, copass);
  }

}