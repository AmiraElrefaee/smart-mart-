import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_mart/features/scan_code/presentation/view/widgets/floating_action_button_camera.dart';
import 'package:smart_mart/features/scan_code/presentation/view/widgets/scan_code_view_body.dart';

import '../../../../core/widgets/custom_bottom_bar.dart';
import '../../../../core/widgets/custom_floating_action_botton.dart';

class ScanCodeView extends StatelessWidget {
  const ScanCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          /// شاشة الهوم تحت كل العناصر
         const  ScanCodeViewBody(),

          /// البار السفلي
          Align(
            alignment: Alignment.bottomCenter,
            child: const CustomBottomBar(),
          ),

          /// الفلوتينج بوتون فوق البار السفلي
          Positioned(
            bottom: 30, // رفعه فوق البار السفلي
            left: MediaQuery.of(context).size.width / 2 - 40, // توسيطه
            child: const FloatingActionButtonCamera()
          ),
        ],
      ),

    );
  }
}
