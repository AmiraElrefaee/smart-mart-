import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:smart_mart/features/category/dmain/entity/categoty_entity.dart';
import 'package:smart_mart/features/sign_up/domain/use_case/register_use_case.dart';

import '../../features/category/data/api_service/category_local_data_source.dart';
import '../../features/category/data/api_service/category_remote_data_source.dart';
import '../../features/category/data/api_service/sub_category_by_id_remote_data_source.dart';
import '../../features/category/data/models/category_model.dart';
import '../../features/category/data/repo_imple/RepoSubCategoryImple.dart';
import '../../features/category/data/repo_imple/repo_imple_category.dart';
import '../../features/login/data/api_service/login_remote_data_source.dart';
import '../../features/login/data/api_service/refresh_token_remote_data_source_dio.dart';
import '../../features/login/data/repo_imple/login_repo_imple.dart';
import '../../features/login/data/repo_imple/refresh_token_repo_imple.dart';
import '../../features/login/domain/repo/login_repo.dart';
import '../../features/login/domain/use_case/login_use_case.dart';
import '../../features/login/presentation/managers/refresh_token_cubit/refresh_token_cubit.dart';
import '../../features/scan_code/data/api_service/scanned_item_remote_data_source.dart';
import '../../features/scan_code/data/repo_imple/repo_imple_sacnned_item.dart';
import '../../features/scan_code/presentation/managers/     scanned_product_socket/scanned_product_socket_cubit.dart';
import '../../features/sign_up/data/api_service/OTP_register_remote_data_source_dio.dart';
import '../../features/sign_up/data/api_service/OTP_sign_up_remote_data_source.dart';
import '../../features/sign_up/data/api_service/forget_password_remote_data_so9urce_dio.dart';
import '../../features/sign_up/data/api_service/forget_password_remote_data_source.dart';
import '../../features/sign_up/data/api_service/register_remote_data_source_dio.dart';
import '../../features/sign_up/data/api_service/sign_up_remote_data_source.dart';
import '../../features/sign_up/data/repo_imple/OTP_sign_up_repo_imple.dart';
import '../../features/sign_up/data/repo_imple/forget_password_repo_imple.dart';
import '../../features/sign_up/data/repo_imple/register_repo_imple.dart';
import '../../features/sign_up/domain/repo/register_repo.dart';
import '../network/api_service.dart';
import '../network/socket_service.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() async{

  // getIt.registerLazySingleton<RegisterUseCase>
  //   (() => RegisterUseCase(RegisterRepo()));
//   getIt.registerLazySingleton<RegisterRmoteDataSource>(() => RegisterRemoteDataSourceImpl());
// hgvkldskldklsdk
  // ✅ تسجيل Repository

// sacn item socket

  getIt.registerLazySingleton<SocketService>(() => SocketService());
  getIt.registerLazySingleton<ScannedProductSocketCubit>(
        () => ScannedProductSocketCubit(),
  );
  // getIt.registerLazySingleton<ScannedProductSocketCubit>(
  //       () => ScannedProductSocketCubit(getIt<SocketService>()),
  // );

//------------------------------------------------------
//subCategory
  getIt.registerLazySingleton<SubCategoryByIdRemoteDataSourceImple>(
          ()=>SubCategoryByIdRemoteDataSourceImple()
  );
  getIt.registerLazySingleton<SubCategoryRepositoryImpl>(
          ()=>SubCategoryRepositoryImpl(
            remoteDataSource: getIt<SubCategoryByIdRemoteDataSourceImple>()
          )
  );
  //--------------------------------------------
  //scaned item fire base
getIt.registerLazySingleton<ScannedItemRemoteDataSourceImple>(
    ()=>ScannedItemRemoteDataSourceImple(FirebaseFirestore.instance)
);
  getIt.registerLazySingleton<ScannedItemRepoImple>(
      ()=>ScannedItemRepoImple(getIt<ScannedItemRemoteDataSourceImple>())
  );

//-------------------------------------------------------------
// category
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
  //forget password
  getIt.registerLazySingleton<ForegtPasswordRemoteDataSourceDio>(
      ()=>ForegtPasswordRemoteDataSourceDio(getIt<ApiService>())
  );
  // getIt.registerLazySingleton<OtpForgetPasswordRemoteDataSource>(
  //         ()=>OtpForgetPasswordRemoteDataSource()
  // );
  getIt.registerLazySingleton<ForgetPasswordRepoImple>(
      ()=>ForgetPasswordRepoImple(getIt<ForegtPasswordRemoteDataSourceDio>()),
  );

  //--------------------------------------
  //scanner
  getIt.registerLazySingleton<MobileScannerController>(
        () => MobileScannerController(),
  );

//----------------------------------------
  // otp sign up
  getIt.registerLazySingleton<OtpSignUpRemoteDataSource>(
        () => OtpSignUpRemoteDataSource(),
  );
  getIt.registerLazySingleton<OtpRegisterRemoteDataSourceDio>(
      ()=>OtpRegisterRemoteDataSourceDio(getIt<ApiService>())
  );


  getIt.registerLazySingleton<OtpSignUpRepoImple>(
        () => OtpSignUpRepoImple(getIt<OtpRegisterRemoteDataSourceDio>()),
  );

  // getIt.registerLazySingleton<OtpSignUpRepoImple>(
  //       () => OtpSignUpRepoImple(getIt<OtpSignUpRemoteDataSource>()),
  // );

//----------------------------------------------------

//sign up
//   getIt.registerLazySingleton<RefreshTokenCubit>(
//         () => RefreshTokenCubit(getIt()), // أو Repository حسب انتي بتعملي إيه
//   );

  // getIt.registerLazySingleton<ApiService>(
  //     ()=>ApiService()
  // );
  getIt.registerSingletonAsync<ApiService>(() async => await ApiService.create());
  await getIt.allReady();
  getIt.registerLazySingleton<RegisterRmoteDataSource>(
        () => RegisterRmoteDataSource(),
  );
  getIt.registerLazySingleton<RegisterRemoteDataSourceDio>(
        () => RegisterRemoteDataSourceDio(getIt<ApiService>()),
  );

  getIt.registerLazySingleton<RegisterRepo>(
        () => RegisterRepoImple(getIt<RegisterRemoteDataSourceDio>()),
  );
  // getIt.registerLazySingleton<RegisterRepo>(
  //       () => RegisterRepoImple(getIt<RegisterRmoteDataSource>()),
  // );

  getIt.registerLazySingleton<RegisterUseCase>(
        () => RegisterUseCase(getIt<RegisterRepo>()),
  );

  //--------------------------
//login
  getIt.registerLazySingleton<LoginRemoteDataSource>(
        () => LoginRemoteDataSource(getIt<ApiService>()),
  );
  getIt.registerLazySingleton<loginRepo>(
        () => loginRepoImple(getIt<LoginRemoteDataSource>()),
  );
  getIt.registerLazySingleton<LoginUseCase>(
        () => LoginUseCase(getIt<loginRepo>()),
  );
  //-------------------------------------------------------
  //refresh token

  getIt.registerLazySingleton<RefreshTokenRemoteDataSourceDio>(
          ()=>RefreshTokenRemoteDataSourceDio(getIt<ApiService>())
  );

  getIt.registerLazySingleton<RefreshTokenRepositoryImpl>(
        ()=>RefreshTokenRepositoryImpl(getIt<RefreshTokenRemoteDataSourceDio>()),
  );
  // ✅ تسجيل Use Case وتمرير الـ Repository له

}
