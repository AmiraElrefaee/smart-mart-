import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:smart_mart/features/category/dmain/entity/categoty_entity.dart';
import 'package:smart_mart/features/sign_up/domain/use_case/register_use_case.dart';

import '../../features/category/data/api_service/category_local_data_source.dart';
import '../../features/category/data/api_service/category_remote_data_source.dart';
import '../../features/category/data/models/category_model.dart';
import '../../features/category/data/repo_imple/repo_imple_category.dart';
import '../../features/login/data/api_service/login_remote_data_source.dart';
import '../../features/login/data/repo_imple/login_repo_imple.dart';
import '../../features/login/domain/repo/login_repo.dart';
import '../../features/login/domain/use_case/login_use_case.dart';
import '../../features/sign_up/data/api_service/OTP_sign_up_remote_data_source.dart';
import '../../features/sign_up/data/api_service/forget_password_remote_data_source.dart';
import '../../features/sign_up/data/api_service/sign_up_remote_data_source.dart';
import '../../features/sign_up/data/repo_imple/OTP_sign_up_repo_imple.dart';
import '../../features/sign_up/data/repo_imple/forget_password_repo_imple.dart';
import '../../features/sign_up/data/repo_imple/register_repo_imple.dart';
import '../../features/sign_up/domain/repo/register_repo.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {

  // getIt.registerLazySingleton<RegisterUseCase>
  //   (() => RegisterUseCase(RegisterRepo()));
//   getIt.registerLazySingleton<RegisterRmoteDataSource>(() => RegisterRemoteDataSourceImpl());
// hgvkldskldklsdk
  // ✅ تسجيل Repository


  getIt.registerLazySingleton<CategoryLocalDataSourceImple>(
      ()=>CategoryLocalDataSourceImple(Hive.box<CategoryModel>('category'))
  );



  getIt.registerLazySingleton<CategoryRemoteDateSourceImple>(
      ()=>CategoryRemoteDateSourceImple()
  );

  getIt.registerLazySingleton<RepoCategoryImple>(
      ()=>RepoCategoryImple(
        categoryLocalDataSource: getIt<CategoryLocalDataSourceImple>(),
        categoryRemoteDateSource: getIt<CategoryRemoteDateSourceImple>()
      )
  );

//-----------------------------------------------------------------------
  getIt.registerLazySingleton<OtpForgetPasswordRemoteDataSource>(
      ()=>OtpForgetPasswordRemoteDataSource()
  );
  getIt.registerLazySingleton<ForgetPasswordRepoImple>(
      ()=>ForgetPasswordRepoImple(getIt<OtpForgetPasswordRemoteDataSource>()),
  );

  //--------------------------------------
  getIt.registerLazySingleton<MobileScannerController>(
        () => MobileScannerController(),
  );

//----------------------------------------
  getIt.registerLazySingleton<OtpSignUpRemoteDataSource>(
        () => OtpSignUpRemoteDataSource(),
  );
  getIt.registerLazySingleton<OtpSignUpRepoImple>(
        () => OtpSignUpRepoImple(getIt<OtpSignUpRemoteDataSource>()),
  );

//----------------------------------------------------

  getIt.registerLazySingleton<RegisterRmoteDataSource>(
        () => RegisterRmoteDataSource(),
  );
  getIt.registerLazySingleton<RegisterRepo>(
        () => RegisterRepoImple(getIt<RegisterRmoteDataSource>()),
  );

  getIt.registerLazySingleton<RegisterUseCase>(
        () => RegisterUseCase(getIt<RegisterRepo>()),
  );

  //--------------------------
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
