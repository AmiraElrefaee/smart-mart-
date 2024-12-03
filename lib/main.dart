import 'package:flutter/material.dart';

import 'core/utils/functions/app_router.dart';
import 'features/splash/presentation/views/splash_view.dart';

void main() {
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

