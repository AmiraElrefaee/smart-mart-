import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_mart/features/on_boarding/presentation/views/widgets/section_botton.dart';
import 'package:smart_mart/features/on_boarding/presentation/views/widgets/section_trigger_points.dart';
import 'package:smart_mart/features/on_boarding/presentation/views/widgets/title_section.dart';

import '../../../../../const.dart';
import '../../../../../utils/functions/app_router.dart';
import '../../../../../utils/styles.dart';
import '../../../data/models/content_model.dart';
import 'custom_background_images.dart';
import 'custom_botton.dart';
import 'description_section.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  int currentIndex = 0;
   late PageController  controller;
  void initState() {
    controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return   Stack(

            children: [

    AnimatedSwitcher(
    duration: const Duration(milliseconds: 1000),
    switchInCurve: Curves.easeInOut,
    switchOutCurve: Curves.easeInOut,
    child: CustomBackgroundImages(
    key: ValueKey<int>(currentIndex),
    index: currentIndex,
    ),
    ),
              SectionTriggerPoints(currentIndex: currentIndex),
              TitleSection(
                key: ValueKey<int>(currentIndex),
                index: currentIndex,
              ),
              DescriptionSection(
                index: currentIndex,
              ),

              SectionBotton(

                currentIndex: currentIndex,
                onNext: () {
                  if (currentIndex < contents.length - 1) {
                    setState(() {
                      currentIndex++;
                    });
                  } else {
                    GoRouter.of(context).push(AppRouter.kloginPage);
                  }
                },
              ),
              Positioned(
                  width: MediaQuery.of(context).size.width,
                  top: MediaQuery.of(context).size.height * .91,
                  child: InkWell(
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.kloginPage);
                      },
                      child: Center(
                        child: Text('Skip',
                          style: Styles.Urbanist20.copyWith(
                              color: ksecodaryColor),
                        ),
                      )))

            ],
          );


  }
}

