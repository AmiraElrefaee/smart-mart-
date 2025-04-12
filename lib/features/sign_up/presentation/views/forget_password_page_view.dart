import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_mart/core/utils/service_locator.dart';
import 'package:smart_mart/features/sign_up/presentation/views/widgets/forget_password_view_body.dart';

import '../../data/repo_imple/forget_password_repo_imple.dart';
import '../managers/forget_password_cubit/foget_password_cubit.dart';

class ForgetPasswordPageView extends StatelessWidget {
  const ForgetPasswordPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FogetPasswordCubit(getIt.get<ForgetPasswordRepoImple>()),
      child: Scaffold(
        body: ForgetPasswordViewBody(),
      ),
    );
  }
}
