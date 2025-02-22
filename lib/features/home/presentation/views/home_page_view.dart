import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_mart/features/home/presentation/views/widgets/home_page_view_body.dart';

import '../../../../core/widgets/custom_bottom_bar.dart';
import '../../../../core/widgets/custom_floating_action_botton.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          /// شاشة الهوم تحت كل العناصر
          HomePageViewBody(),

          /// البار السفلي
          Align(
            alignment: Alignment.bottomCenter,
            child: const CustomBottomBar(),
          ),

          /// الفلوتينج بوتون فوق البار السفلي
          Positioned(
            bottom: 30, // رفعه فوق البار السفلي
            left: MediaQuery.of(context).size.width / 2 - 40, // توسيطه
            child: const CustomFloatingActionButton(),
          ),
        ],
      ),
    );
  }
}
