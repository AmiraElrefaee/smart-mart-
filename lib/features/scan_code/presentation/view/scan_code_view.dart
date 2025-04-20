import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_mart/core/utils/functions/app_router.dart';
import 'package:smart_mart/features/scan_code/presentation/view/widgets/floating_action_button_camera.dart';
import 'package:smart_mart/features/scan_code/presentation/view/widgets/scan_code_view_body.dart';
import 'package:smart_mart/features/scan_code/presentation/view/widgets/section-title_app_bar.dart';

import '../../../../core/utils/service_locator.dart';
import '../../../../core/widgets/custom_bottom_bar.dart';
import '../../../../core/widgets/custom_floating_action_botton.dart';
import '../../data/repo_imple/repo_imple_sacnned_item.dart';
import '../managers/cubit_scanned_item/scanned_item_cubit.dart';

class ScanCodeView extends StatelessWidget {
  const ScanCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        leading: IconButton(
          icon: Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Icon(Icons.arrow_back_ios_new_outlined),
          ),
          onPressed: () {
            context.go(AppRouter.khome);
          },
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: SectionTitleAppBar(),
      ),
      resizeToAvoidBottomInset: false,
      body: const ScanCodeViewBody(),

    );
  }
}
