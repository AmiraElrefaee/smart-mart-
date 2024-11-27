

import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_mart/features/login/presentation/views/login_view.dart';
import 'package:smart_mart/features/on_boarding/presentation/views/onBoarding_view.dart';

import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const konBoarding='/OnboardingView';
  static const kloginPage='/LoginLoginView';
   static final router = GoRouter(
    routes: [
      GoRoute(path: kloginPage,
      builder: (context,state)=> const LoginView()),
     GoRoute(path:'/',
     builder: (context,state)=> const SplashView()
     ),
      GoRoute(path: konBoarding,
      builder: (context,state)=>const OnboardingView(),
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const OnboardingView(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          );
        },
      )
      // GoRoute(
      //     path: kSearchView, builder: (context, state) => const SearchView())
    ],
  );
}
