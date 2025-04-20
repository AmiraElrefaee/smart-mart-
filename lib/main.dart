import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:smart_mart/features/category/data/models/category_model.dart';
import 'core/utils/functions/app_router.dart';
import 'core/utils/service_locator.dart';
import 'features/splash/presentation/views/splash_view.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  // Hive.registerAdapter(CategoryModelAdapter());
  Hive.registerAdapter(CategoryModelAdapter()); // فعلّيه ضروري

  await Hive.openBox<CategoryModel>('category');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // تهيئة Firebase
  );
  setupLocator();
  runApp(const MyApp());
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
      debugShowCheckedModeBanner: false,
      // home: const SplashView(),
    );
  }
}

