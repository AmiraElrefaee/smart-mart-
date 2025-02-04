import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_mart/features/login/domain/use_case/login_use_case.dart';
import 'package:smart_mart/features/login/presentation/views/widgets/login_view_body.dart';

import '../../../../core/utils/service_locator.dart';
import '../managers/login_cubit/login_cubit.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt.get<LoginUseCase>()),
      child: Scaffold(
          body: LoginViewBody()
      ),
    );
  }
}
