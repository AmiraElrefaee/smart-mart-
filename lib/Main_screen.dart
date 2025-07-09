import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'core/utils/functions/app_router.dart';
import 'core/widgets/custom_bottom_bar.dart';
import 'features/home/presentation/views/widgets/section_drawer_home.dart';
import 'features/scan_code/presentation/view/widgets/section_draggle_total_num.dart';

class MainScreen extends StatefulWidget {
  final Widget child;
  MainScreen({required this.child});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    // bool isScanPage=false;
    // setState(() {
    //   isScanPage  = GoRouterState.of(context).uri.toString() == AppRouter.kScanPage;
    // });


    return Scaffold(
      // drawer: SectionDrawerHome(),

      resizeToAvoidBottomInset: false,
      body:
      Stack(
        children: [
          widget.child, // الشاشة الرئيسية

          // عنصر SectionDraggleTotalNum تحته البوتوم بار

          // if (isScanPage)
          //   Positioned(
          //       bottom: MediaQuery.of(context).size.height * 0.007,
          //       child: SectionDraggleTotalNum()),
          // البوتوم بار فوقه
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomBottomBar(),
          ),

          // if (isScanPage)
          // Positioned(
          //   // مسافة كافية ليظهر تحت البوتوم بار
          //   left: 0,
          //   right: 0,
          //   child: SectionDraggleTotalNum(),
          // ),
        ],
      ),
    );
  }
}
