

import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_mart/features/login/presentation/views/login_view.dart';
import 'package:smart_mart/features/on_boarding/presentation/views/onBoarding_view.dart';

import '../../features/sign_up/presentation/views/add_phone_num_view.dart';
import '../../features/sign_up/presentation/views/sign_up_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const konBoarding='/OnboardingView';
  static const kloginPage='/LoginLoginView';
  static const kSignUpPage='/SignUpView';
  static const kAddPhoneNumPage='/AddPhoneNumView';
   static final router = GoRouter(
    routes: [
      GoRoute(path: kAddPhoneNumPage,
      builder: (context,state)=> const AddPhoneNumView()
      ),
      GoRoute(path: kloginPage,
      builder: (context,state)=> const LoginView(),
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const LoginView(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          );
        },
      ),

     GoRoute(path:'/',
     builder: (context,state)=> const SplashView()
         ,
     ),

      GoRoute(path: konBoarding,
      builder: (context,state)=>const OnboardingView(),

        // pageBuilder: (context, state) {
        //   return CustomTransitionPage(
        //     key: state.pageKey,
        //     child: const OnboardingView(),
        //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
        //       return FadeTransition(
        //         opacity: animation,
        //         child: child,
        //       );
        //     },
        //   );
        // },

      ),

      GoRoute(path: kSignUpPage,
      builder: (context, state)=> const SignUpView(),

  // pageBuilder: (context, state) {
  // return CustomTransitionPage(
  // key: state.pageKey,
  // child: const SignUpView(),
  // transitionsBuilder: (context, animation, secondaryAnimation, child) {
  // return FadeTransition(
  // opacity: animation,
  // child: child,
  // );
  // },
  // );
  // },
      )
      // GoRoute(
      //     path: kSearchView, builder: (context, state) => const SearchView())
    ],
  );
}
