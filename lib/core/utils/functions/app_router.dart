

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_mart/core/domain/entities/item_model.dart';
import 'package:smart_mart/features/details_item/presentation/views/details_psge_view.dart';
import 'package:smart_mart/features/home/presentation/views/home_page_view.dart';
import 'package:smart_mart/features/login/presentation/views/login_view.dart';
import 'package:smart_mart/features/on_boarding/presentation/views/onBoarding_view.dart';
import 'package:smart_mart/features/scan_code/presentation/view/scan_code_view.dart';
import 'package:smart_mart/features/sign_up/presentation/views/OTP_view.dart';

import '../../../Main_screen.dart';
import '../../../features/category/data/models/category_model.dart';
import '../../../features/category/presentation/views/category_page_view.dart';
import '../../../features/category/presentation/views/item_category_page_view.dart';
import '../../../features/login/presentation/managers/login_cubit/login_cubit.dart';
import '../../../features/payment/presentation/views/add_cart_cards_page.dart';
import '../../../features/payment/presentation/views/complete_page_view.dart';
import '../../../features/payment/presentation/views/payment_page_view.dart';
import '../../../features/scan_code/presentation/view/cart_page_view.dart';
import '../../../features/scan_code/presentation/view/sucess_page_view.dart';
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
  static const ksucessConnectToCart='/SucessPageView';
  static const kAddToCart='/CartPageView';
   static final router = GoRouter(

    routes: [
       ShellRoute(
         routes: [
           GoRoute(path: kitemCategory,
           builder:(context,state){

             final data = state.extra as Map<String, dynamic>;
             final id = data['id'];
             final name = data['name'];
             final image = data['image'];
             return ItemCategoryPageView(
               id: id ,
             );

           },

           ),
           GoRoute(path: kcategory,
           builder: (context,state){
             // final data = state.extra as ItemModel ;
             return CategoryPageView(

             );
           }
            ),
           GoRoute(path: kSearch,
           builder: (context, state)=> const SearchPageView()
           ),
           GoRoute(
             path: khome,
             builder: (context, state) {
               // final token = state.extra as Map<String, dynamic>; // تحقق من أن state.extra ليس null
               return HomePageView();
             },
           ),
           GoRoute(
             path: '/favorites',
             builder: (context, state) =>const WishlistPageView(),
           ),
           GoRoute(
             path: '/profile',
             builder: (context, state) => const WishlistPageView(),
           ),
           GoRoute(
             path: '/cart',
             builder: (context, state) =>const  WishlistPageView(),
           ),
           GoRoute(
             path: kScanPage,
             builder: (context, state) =>const ScanCodeView(),
           ),
           GoRoute(
             path:kdetails,
             builder: (context, state) {
               final data = state.extra as ItemModel ;
               return DetailsPageView(
                   item :data
               );
             },
           ),
           // GoRoute(path: ksucessConnectToCart,
           //
           //     builder: (context, state )=>const SucessPageView ()
           // ),
           // GoRoute(path: kcompletePayment,
           //     builder: (context, state )=>const CompletePageView()
           // ),
         ],
       builder: (context, state, child) {
             return MainScreen(child: child);},
       ),
      GoRoute(path: ksucessConnectToCart,

          builder: (context, state )=>const SucessPageView ()
      ),
      GoRoute(path: kcompletePayment,
          builder: (context, state )=>const CompletePageView()
      ),
      GoRoute(path: kPayment,
      builder: (context, state )=>const PaymentPageView()
      ),
      GoRoute(path:kaddCartCard ,
      builder: (context,state)=> const AddCartCardsPage()
      ),
      GoRoute(
        path: kScanPage,
        builder: (context, state) =>const ScanCodeView(),
      ),
      GoRoute(path: khome,
        builder: (context, state) {
          // final token = state.extra as Map<String, dynamic>; // تحقق من أن state.extra ليس null
          return HomePageView();
        },
      ),
      // GoRoute(path: kdetails,
      //     builder: (contxet,state)=>const DetailsPageView()
      // ),
      GoRoute(path: kAddToCart,
          builder: (context,state)=> const CartPageView()),

      GoRoute(path: kCreateNewPasswordpage,
      builder: (context,state)=> const CreateNewPasswordpageView()),

      GoRoute(path: kOtpForgetPasswordPage,
      builder: (context, state )=>  const OtpForgetPasswordPageView()
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
