import 'package:get_it/get_it.dart';
import 'package:smart_mart/features/sign_up/domain/use_case/register_use_case.dart';

import '../../features/sign_up/data/api_service/register_remote_data_source.dart';
import '../../features/sign_up/data/repo_imple/register_repo_imple.dart';
import '../../features/sign_up/domain/repo/register_repo.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {

  // getIt.registerLazySingleton<RegisterUseCase>
  //   (() => RegisterUseCase(RegisterRepo()));
//   getIt.registerLazySingleton<RegisterRmoteDataSource>(() => RegisterRemoteDataSourceImpl());
// hgvkldskldklsdk
  // ✅ تسجيل Repository
  getIt.registerLazySingleton<RegisterRmoteDataSource>(
        () => RegisterRmoteDataSource(),
  );
  getIt.registerLazySingleton<RegisterRepo>(
        () => RegisterRepoImple(getIt<RegisterRmoteDataSource>()),
  );

  getIt.registerLazySingleton<RegisterUseCase>(
        () => RegisterUseCase(getIt<RegisterRepo>()),
  );
  // ✅ تسجيل Use Case وتمرير الـ Repository له

}
