import 'package:get_it/get_it.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:smart_mart/features/sign_up/domain/use_case/register_use_case.dart';

import '../../features/login/data/api_service/login_remote_data_source.dart';
import '../../features/login/data/repo_imple/login_repo_imple.dart';
import '../../features/login/domain/repo/login_repo.dart';
import '../../features/login/domain/use_case/login_use_case.dart';
import '../../features/sign_up/data/api_service/OTP_sign_up_remote_data_source.dart';
import '../../features/sign_up/data/api_service/register_remote_data_source.dart';
import '../../features/sign_up/data/repo_imple/OTP_sign_up_repo_imple.dart';
import '../../features/sign_up/data/repo_imple/register_repo_imple.dart';
import '../../features/sign_up/domain/repo/register_repo.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {

  // getIt.registerLazySingleton<RegisterUseCase>
  //   (() => RegisterUseCase(RegisterRepo()));
//   getIt.registerLazySingleton<RegisterRmoteDataSource>(() => RegisterRemoteDataSourceImpl());
// hgvkldskldklsdk
  // ✅ تسجيل Repository
  getIt.registerLazySingleton<MobileScannerController>(
        () => MobileScannerController(),
  );


  getIt.registerLazySingleton<OtpSignUpRemoteDataSource>(
        () => OtpSignUpRemoteDataSource(),
  );
  getIt.registerLazySingleton<OtpSignUpRepoImple>(
        () => OtpSignUpRepoImple(getIt<OtpSignUpRemoteDataSource>()),
  );



  getIt.registerLazySingleton<RegisterRmoteDataSource>(
        () => RegisterRmoteDataSource(),
  );
  getIt.registerLazySingleton<RegisterRepo>(
        () => RegisterRepoImple(getIt<RegisterRmoteDataSource>()),
  );

  getIt.registerLazySingleton<RegisterUseCase>(
        () => RegisterUseCase(getIt<RegisterRepo>()),
  );
  getIt.registerLazySingleton<LoginRemoteDataSource>(
        () => LoginRemoteDataSource(),
  );
  getIt.registerLazySingleton<loginRepo>(
        () => loginRepoImple(getIt<LoginRemoteDataSource>()),
  );
  getIt.registerLazySingleton<LoginUseCase>(
        () => LoginUseCase(getIt<loginRepo>()),
  );
  // ✅ تسجيل Use Case وتمرير الـ Repository له

}
