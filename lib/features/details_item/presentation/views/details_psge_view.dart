import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_mart/features/home/presentation/views/widgets/home_page_view_body.dart';
import 'package:smart_mart/features/details_item/presentation/views/widgets/details_page_view_body.dart';
import 'package:smart_mart/core/widgets/custom_bottom_bar.dart';
import 'package:smart_mart/core/widgets/custom_floating_action_botton.dart';

class DetailsPsgeView extends StatefulWidget {
  const DetailsPsgeView({super.key});

  @override
  State<DetailsPsgeView> createState() => _DetailsPageViewState();
}

class _DetailsPageViewState extends State<DetailsPsgeView> {
  int _selectedIndex = 0; // خليها نفس متغير الهوم علشان التنقل يكون سليم

  final List<Widget> _pages = [
    const HomePageViewBody(),
    // ضيفي باقي الصفحات هنا
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:  const DetailsPageViewBody(),

      // Stack(
      //   children: [
      //     /// عرض الصفحة المناسبة حسب الاختيار
      //     IndexedStack(
      //       index: _selectedIndex,
      //       children: [
      //         const DetailsPageViewBody(),
      //
      //         // خليها أول واحدة علشان لو رجع للديتيلز تبقى موجودة
      //         // الصفحة الرئيسية
      //         // ضيفي باقي الصفحات هنا
      //       ],
      //     ),
      //
      //     /// البار السفلي
      //     Align(
      //       alignment: Alignment.bottomCenter,
      //       child: CustomBottomBar(
      //         selectedIndex: _selectedIndex,
      //         onItemTapped: _onItemTapped,
      //       ),
      //     ),
      //
      //     /// الفلوتينج بوتون فوق البار السفلي
      //     Positioned(
      //       bottom: 30, // رفعه فوق البار السفلي
      //       left: MediaQuery.of(context).size.width / 2 - 40, // توسيطه
      //       child:  CustomFloatingActionButton(
      //         onItemTapped: _onItemTapped,
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
