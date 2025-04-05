import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_mart/core/utils/service_locator.dart';
import 'package:smart_mart/features/sign_up/presentation/views/widgets/OTP_view_body.dart';

import '../../data/repo_imple/OTP_sign_up_repo_imple.dart';
import '../managers/OTP_sign_up_cubit/otp_sign_up_cubit.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OtpSignUpCubit(getIt.get<OtpSignUpRepoImple>()),
      child: Scaffold(
        body: OtpViewBody(),
      ),
    );
  }
}
