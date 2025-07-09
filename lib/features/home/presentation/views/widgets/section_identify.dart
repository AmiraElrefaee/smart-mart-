import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_mart/features/login/presentation/managers/login_cubit/login_cubit.dart';

import '../../../../profile/presentation/views/widgets/profile_image_picker.dart';

class SectionIdentify extends StatelessWidget {
  const SectionIdentify({
    super.key,
    required this.fontName,
    required this.fontEmail,
    required this.raduis,
  });

  final double fontName;
  final double fontEmail;
  final double raduis;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        if (state is LoginSuccess) {
          final firstName = state.decodedToken['firstName'];
          final lastName = state.decodedToken['lastName'];
          final email = state.decodedToken['email'];

          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: ProfileImagePicker(
                  email: email,
                  raduis: 22.w,
                )
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$firstName $lastName',
                      style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: fontName,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      email.split('@')[0],
                      style: TextStyle(
                        color: const Color(0xff989797),
                        fontFamily: 'Urbanist',
                        fontSize: fontEmail,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        } else {
          return const SizedBox(); // أو ممكن Loader صغير
        }
      },
    );
  }
}
