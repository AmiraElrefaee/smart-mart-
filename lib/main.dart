import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:smart_mart/features/category/data/models/category_model.dart';
import 'const.dart';
import 'core/network/socket_service.dart';
import 'core/utils/functions/app_router.dart';
import 'core/utils/service_locator.dart';
import 'features/login/data/repo_imple/refresh_token_repo_imple.dart';
import 'features/login/domain/use_case/login_use_case.dart';
import 'features/login/presentation/managers/login_cubit/login_cubit.dart';
import 'features/login/presentation/managers/refresh_token_cubit/refresh_token_cubit.dart';
import 'features/scan_code/presentation/managers/     scanned_product_socket/scanned_product_socket_cubit.dart';
import 'features/scan_code/presentation/managers/socket_error_cubit/socket_error_cubit.dart';
import 'features/splash/presentation/views/splash_view.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  // Hive.registerAdapter(CategoryModelAdapter());
  Hive.registerAdapter(CategoryModelAdapter()); // فعلّيه ضروري
  await Hive.deleteBoxFromDisk('category'); // اسم البوكس هو 'category'

  await Hive.openBox<CategoryModel>('category');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // تهيئة Firebase
  );
  setupLocator();
  runApp(
    MultiBlocProvider(
      providers: [
        // توفير LoginCubit لكافة الصفحات
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(getIt.get<LoginUseCase>()),
        ),
        BlocProvider<RefreshTokenCubit>(
          create: (context) => RefreshTokenCubit(getIt.get<RefreshTokenRepositoryImpl>()),
        ),
        BlocProvider<ScannedProductSocketCubit>(
          create: (context) => ScannedProductSocketCubit(),
        ),
        //SocketErrorCubit
        BlocProvider<SocketErrorCubit>(
          create: (context) => SocketErrorCubit(),
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
}

