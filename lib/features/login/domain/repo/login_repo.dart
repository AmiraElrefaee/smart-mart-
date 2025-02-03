import '../entity/login_entity.dart';

abstract class loginRepo {
  Future<Token> login(String email, String password);
}
