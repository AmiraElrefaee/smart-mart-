import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_mart/features/sign_up/domain/use_case/register_use_case.dart';
import 'package:smart_mart/features/sign_up/presentation/views/widgets/signup_view_body.dart';

import '../../../../core/utils/service_locator.dart';
import '../managers/register_cubit/register_cubit.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(getIt.get<RegisterUseCase>()),
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        body: SignupViewBody(),),
    );
  }
}
