import '../entity/login_entity.dart';

abstract class RefreshTokenRepository {
  Future<Token> refreshToken();
}
