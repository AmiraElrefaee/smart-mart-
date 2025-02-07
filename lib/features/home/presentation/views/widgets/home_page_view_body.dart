import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_mart/const.dart';
import 'package:smart_mart/features/home/presentation/views/widgets/section_discount.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../on_boarding/presentation/views/widgets/section_trigger_points.dart';
import 'custom_app_bar.dart';
import 'custom_search_bar.dart';

class HomePageViewBody extends StatefulWidget {
  const HomePageViewBody({super.key});

  @override
  State<HomePageViewBody> createState() => _HomePageViewBodyState();
}

class _HomePageViewBodyState extends State<HomePageViewBody> {
  final PageController _pageController = PageController();
  int currentIndex = 0; // لتتبع الصفحة الحالية

  @override
  void dispose() {
    _pageController.dispose(); // تحرير الذاكرة عند التخلص من الـ Widget
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * .06),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 34),
              child: CustomAppBar(screenWidth: screenWidth),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 11),
              child: CustomSearchBar(screenWidth: screenWidth),
            ),
            SizedBox(
              height: 200, // ارتفاع ثابت لـ ListView
              child: PageView.builder(
                // controller: _pageController,
                itemCount: 3,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index; // تحديث currentIndex عند تغيير الصفحة
                  });
                },
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(5),
                    child: SizedBox(
                      width: screenWidth * 0.86, // عرض كل عنصر في ListView
                      child: SectionDisconut(screenWidth: screenWidth),
                    ),
                  );
                },
              ),
            ),
            SectionTriggerPoints(currentIndex: currentIndex), // تمرير currentIndex
          ],
        ),
      ),
    );
  }
}

