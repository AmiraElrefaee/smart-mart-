import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_mart/core/utils/functions/app_router.dart';
import 'package:smart_mart/features/scan_code/presentation/view/widgets/floating_action_button_camera.dart';
import 'package:smart_mart/features/scan_code/presentation/view/widgets/scan_code_view_body.dart';
import 'package:smart_mart/features/scan_code/presentation/view/widgets/section-title_app_bar.dart';
import 'package:smart_mart/features/search/presentation/views/widgets/scan_Qr_code_product_view_body.dart';

import '../../../../core/utils/service_locator.dart';
import '../../../../core/widgets/custom_bottom_bar.dart';
import '../../../../core/widgets/custom_floating_action_botton.dart';
import '../../data/repo_imple/repo_imple_search_qrcode.dart';
import '../managers/search_qr_code_cubit/search_qr_code_cubit.dart';


class ScanQrCodeProductView extends StatelessWidget {
  const ScanQrCodeProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchQrCodeCubit( getIt.get<RepoImpleSearchQrcode>()),
      child: Scaffold(
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
        body: const ScanQrCodeProductViewBody(),

      ),
    );
  }
}
