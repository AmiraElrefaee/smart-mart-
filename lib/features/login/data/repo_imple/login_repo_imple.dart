import 'package:smart_mart/features/login/domain/entity/login_entity.dart';
import 'package:smart_mart/features/login/domain/repo/login_repo.dart';

import '../api_service/login_remote_data_source.dart';

class loginRepoImple implements loginRepo{
  final LoginRemoteDataSource loginRemoteDataSource;

  loginRepoImple(this.loginRemoteDataSource);
  @override
  Future<Token> login(String email, String password) async{
 return await loginRemoteDataSource.login(email, password);
  }
  
}