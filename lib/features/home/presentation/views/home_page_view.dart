import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_mart/const.dart';
import 'package:smart_mart/features/home/presentation/views/widgets/home_page_view_body.dart';

import '../../../../core/widgets/custom_bottom_bar.dart';
import '../../../../core/widgets/custom_floating_action_botton.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation:  FloatingActionButtonLocation.miniCenterDocked,
      resizeToAvoidBottomInset: false,
      floatingActionButton: CustomFloatingActionButton() ,
      bottomNavigationBar:CustomBottomBar() ,
      body: HomePageViewBody(),
    );
  }
}

