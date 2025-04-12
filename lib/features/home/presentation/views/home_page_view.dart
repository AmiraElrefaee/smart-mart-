import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_mart/core/utils/service_locator.dart';
import 'package:smart_mart/features/category/data/models/category_model.dart';
import 'package:smart_mart/features/category/presentation/managers/category_cubit/category_cubit.dart';
import 'package:smart_mart/features/home/presentation/views/widgets/home_page_view_body.dart';
import 'package:smart_mart/features/details_item/presentation/views/widgets/details_page_view_body.dart';
import 'package:smart_mart/core/widgets/custom_bottom_bar.dart';
import 'package:smart_mart/core/widgets/custom_floating_action_botton.dart';

import '../../../category/data/repo_imple/repo_imple_category.dart';
import '../../../scan_code/presentation/view/scan_code_view.dart';
import '../../../wish_list/wish_list_ view.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePageViewBody(),
    const WishlistPageView(),
    const WishlistPageView(),
    const WishlistPageView(),
    // const ScanCodeView(),
    // Add more pages here
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit(getIt.get<RepoCategoryImple>()),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: HomePageViewBody()

        // Stack(
        //   children: [
        //     /// شاشة الهوم تحت كل العناصر
        //     IndexedStack(
        //       index: _selectedIndex,
        //       children: _pages,
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
      ),
    );
  }
}