// core/helpers/token_storage.dart
import 'package:hive/hive.dart';

class TokenStorage {
  static const _tokenBox = 'authBox';
  static const _accessTokenKey = 'accessToken';
  static const _refreshTokenKey = 'refreshToken';

  static Future<void> saveTokens(String accessToken, String refreshToken) async {
    final box = await Hive.openBox(_tokenBox);
    await box.put(_accessTokenKey, accessToken);
    await box.put(_refreshTokenKey, refreshToken);
  }

  static Future<String?> getAccessToken() async {
    final box = await Hive.openBox(_tokenBox);
    return box.get(_accessTokenKey);
  }

  static Future<String?> getRefreshToken() async {
    final box = await Hive.openBox(_tokenBox);
    return box.get(_refreshTokenKey);
  }

  static Future<void> clearTokens() async {
    final box = await Hive.openBox(_tokenBox);
    await box.delete(_accessTokenKey);
    await box.delete(_refreshTokenKey);
  }
}
