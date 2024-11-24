import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_mart/features/splash/presentation/views/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
//background: #FFFFFF;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:SplashViewBody()
    );
  }
}
