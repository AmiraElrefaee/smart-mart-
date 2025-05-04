
import 'package:smart_mart/features/login/domain/entity/login_entity.dart';

import '../../domain/repo/refresh_token-repo.dart';
import '../api_service/refresh_token_remote_data_source_dio.dart';

class RefreshTokenRepositoryImpl implements RefreshTokenRepository {
  final RefreshTokenRemoteDataSourceDio remoteDataSource;

  RefreshTokenRepositoryImpl(this.remoteDataSource);

  @override
  Future<Token> refreshToken() async {
    return await remoteDataSource.refreshAccessToken();
  }
}
