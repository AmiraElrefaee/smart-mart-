import 'package:smart_mart/features/login/domain/entity/login_entity.dart';

import '../repo/login_repo.dart';

class LoginUseCase{
  final loginRepo loginrepo;

  LoginUseCase(this.loginrepo);
  Future<Token> call(String email , String pass){
    return loginrepo.login(email, pass);
  }
}