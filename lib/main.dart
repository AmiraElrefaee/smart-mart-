import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:smart_mart/features/category/data/models/category_model.dart';
import 'const.dart';
import 'core/network/api_service.dart';
import 'core/network/socket_service.dart';
import 'core/utils/functions/app_router.dart';
import 'core/utils/service_locator.dart';
import 'features/login/data/api_service/login_remote_data_source.dart';
import 'features/login/data/repo_imple/refresh_token_repo_imple.dart';
import 'features/login/domain/use_case/login_use_case.dart';
import 'features/login/presentation/managers/login_cubit/login_cubit.dart';
import 'features/login/presentation/managers/refresh_token_cubit/refresh_token_cubit.dart';
import 'features/scan_code/presentation/managers/     scanned_product_socket/scanned_product_socket_cubit.dart';
import 'features/scan_code/presentation/managers/socket_error_cubit/socket_error_cubit.dart';
import 'features/splash/presentation/views/splash_view.dart';
import 'features/whishList/data/repo_imple/whish_list_repo_imple.dart';
import 'features/whishList/presentation/managers/show_whish_list_cibit/show_whish_list_cubit.dart';
import 'features/whishList/presentation/managers/whish_list_cubit/whish_list_cubit.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  // Hive.registerAdapter(CategoryModelAdapter());
  Hive.registerAdapter(CategoryModelAdapter()); // فعلّيه ضروري
  await Hive.deleteBoxFromDisk('category'); // اسم البوكس هو 'category'

  await Hive.openBox<CategoryModel>('category');
  await Hive.openBox('authBox');
  final apiService = await ApiService.create();
  final loginRemoteDataSource = LoginRemoteDataSource(apiService);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // تهيئة Firebase
  );

  await setupLocator();
  runApp(
    MultiBlocProvider(
      providers: [
        // توفير LoginCubit لكافة الصفحات
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(getIt.get<LoginUseCase>()),
        ),
        // BlocProvider<RefreshTokenCubit>(
        //   create: (context) => RefreshTokenCubit(getIt.get<RefreshTokenRepositoryImpl>()),
        // ),
        BlocProvider<ScannedProductSocketCubit>(
          create: (context) => ScannedProductSocketCubit(),
        ),
        //SocketErrorCubit
        BlocProvider<SocketErrorCubit>(
          create: (context) => SocketErrorCubit(),
        ),
        BlocProvider<WhishListCubit>(
          create: (context) => WhishListCubit(getIt.get<WishlistRepoImpl>()),
        ),
        BlocProvider<ShowWhishListCubit>(
          create: (context) => ShowWhishListCubit(getIt.get<WishlistRepoImpl>()),
        ),
        // يمكن إضافة أي providers أخرى هنا
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 858), // ده مقاس تصميمك الأصلي (مثلاً من Figma)
        minTextAdapt: true,
        splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
          ),
          color: Colors.white,
          routerConfig: AppRouter.router,
          // navigatorObservers: [routeObserver],
          debugShowCheckedModeBanner: false,
          // home: const SplashView(),
        );
      }
    );
  }
}

