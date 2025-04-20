import 'package:smart_mart/features/sign_up/data/api_service/sign_up_remote_data_source.dart';
import 'package:smart_mart/features/sign_up/domain/repo/register_repo.dart';

import '../api_service/register_remote_data_source_dio.dart';

class RegisterRepoImple implements RegisterRepo{
  final RegisterRemoteDataSourceDio registerRmoteDataSource;

  RegisterRepoImple(this.registerRmoteDataSource);
  @override
  Future<Map<String, dynamic>> register
      (String fname, String lname, String mail, String pass, String copass,num phone) {
    return registerRmoteDataSource
        .registerUser(mail, fname, lname, pass, copass,phone);
  }

}