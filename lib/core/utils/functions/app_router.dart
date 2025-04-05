

import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_mart/features/details_item/presentation/views/details_psge_view.dart';
import 'package:smart_mart/features/home/presentation/views/home_page_view.dart';
import 'package:smart_mart/features/login/presentation/views/login_view.dart';
import 'package:smart_mart/features/on_boarding/presentation/views/onBoarding_view.dart';
import 'package:smart_mart/features/scan_code/presentation/view/scan_code_view.dart';
import 'package:smart_mart/features/sign_up/presentation/views/OTP_view.dart';

import '../../../Main_screen.dart';
import '../../../features/category/presentation/views/category_page_view.dart';
import '../../../features/category/presentation/views/item_category_page_view.dart';
import '../../../features/payment/presentation/views/add_cart_cards_page.dart';
import '../../../features/payment/presentation/views/complete_page_view.dart';
import '../../../features/payment/presentation/views/payment_page_view.dart';
import '../../../features/search/presentation/views/search_page_view.dart';
import '../../../features/sign_up/domain/use_case/register_use_case.dart';
import '../../../features/sign_up/presentation/views/OTP_forget_password_page_view.dart';
import '../../../features/sign_up/presentation/views/add_phone_num_view.dart';
import '../../../features/sign_up/presentation/views/create_new_password_page_view.dart';
import '../../../features/sign_up/presentation/views/forget_password_page_view.dart';
import '../../../features/sign_up/presentation/views/sign_up_view.dart';
import '../../../features/splash/presentation/views/splash_view.dart';
import '../../../features/wish_list/wish_list_ view.dart';



abstract class AppRouter {
  static const konBoarding='/OnboardingView';
  static const kloginPage='/LoginLoginView';
  static const kSignUpPage='/SignUpView';
  static const kAddPhoneNumPage='/AddPhoneNumView';
  static const kOTPpage='/OtpView' ;
  static const kForgetPasswordPage='/ForgetPasswordPageView' ;
  static const kOtpForgetPasswordPage='/OtpForgetPasswordPageView';
  static const kCreateNewPasswordpage='/CreateNewPasswordpageView';
  static const khome='/HomePageView';
  // static const khome='/';
  static const kdetails='/DetailsPageView';
  static const kwishList='/WishlistPageView';
  static const kScanPage='/ScanCodeView';
  static const kPayment='/PaymentView';
  static const kaddCartCard='/AddCartCardsPage';
  static const kcompletePayment='/CompletePageView';
  static const kSearch='/SearchPageView';
  static const kcategory='/CategoryPageView';
  static const kitemCategory='/ItemCategoryPageView';
   static final router = GoRouter(

    routes: [
       ShellRoute(
         routes: [
           GoRoute(path: kitemCategory,
           builder:(context,state)=>ItemCategoryPageView()
           ),
           GoRoute(path: kcategory,
           builder: (context,state)=>CategoryPageView()
            ),
           GoRoute(path: kSearch,
           builder: (context, state)=>SearchPageView()
           ),
           GoRoute(
             path: khome,
             builder: (context, state) => HomePageView(),
           ),
           GoRoute(
             path: '/favorites',
             builder: (context, state) => WishlistPageView(),
           ),
           GoRoute(
             path: '/profile',
             builder: (context, state) => WishlistPageView(),
           ),
           GoRoute(
             path: '/cart',
             builder: (context, state) => WishlistPageView(),
           ),
           GoRoute(
             path: kScanPage,
             builder: (context, state) => ScanCodeView(),
           ),
           GoRoute(
             path:kdetails,
             builder: (context, state) {

               return DetailsPsgeView();
             },
           ),
         ],
       builder: (context, state, child) {
  return MainScreen(child: child);},
       ),
      GoRoute(path: kcompletePayment,
          builder: (context, state )=>CompletePageView()
      ),
      GoRoute(path: kPayment,
      builder: (context, state )=>PaymentPageView()
      ),
      GoRoute(path:kaddCartCard ,
      builder: (context,state)=>AddCartCardsPage()
      ),
      GoRoute(
        path: kScanPage,
        builder: (context, state) => ScanCodeView(),
      ),
      GoRoute(path: khome,
     builder: (contxet,state)=> HomePageView()
      ),
      GoRoute(path: kdetails,
          builder: (contxet,state)=> DetailsPsgeView()
      ),
      GoRoute(path: kCreateNewPasswordpage,
      builder: (context,state)=>CreateNewPasswordpageView()),

      GoRoute(path: kOtpForgetPasswordPage,
      builder: (context, state )=>OtpForgetPasswordPageView()
      ),

      GoRoute(path: kForgetPasswordPage,
      builder: (context,state)=> const ForgetPasswordPageView()
      ),

      GoRoute(path: kAddPhoneNumPage,
          builder: (context,state)=> const AddPhoneNumView()
      ),

      GoRoute(path: kOTPpage,
      builder: (context,state)=>const  OtpView()
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
