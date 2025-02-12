import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_mart/features/details_item/presentation/views/widgets/details_page_view_body.dart';

import '../../../../core/widgets/custom_bottom_bar.dart';
import '../../../../core/widgets/custom_floating_action_botton.dart';

class DetailsPsgeView extends StatelessWidget {
  const DetailsPsgeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation:  FloatingActionButtonLocation.miniCenterDocked,
      resizeToAvoidBottomInset: false,
      floatingActionButton: CustomFloatingActionButton() ,
      bottomNavigationBar:CustomBottomBar() ,
      body: DetailsPageViewBody(),

    );
  }
}
