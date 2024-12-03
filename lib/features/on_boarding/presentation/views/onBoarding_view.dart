import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_mart/const.dart';
import 'package:smart_mart/features/on_boarding/presentation/views/widgets/onBoarding_view_body.dart';


class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:OnboardingViewBody()

    );}
}
