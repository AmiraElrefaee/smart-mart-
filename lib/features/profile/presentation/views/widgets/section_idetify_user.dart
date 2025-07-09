import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_mart/features/profile/presentation/views/widgets/profile_image_picker.dart';

import '../../../../home/presentation/views/widgets/custom_botton_menu_bar.dart';
import '../../../../login/presentation/managers/login_cubit/login_cubit.dart';

class SectionIdentifyUser extends StatelessWidget {
  const SectionIdentifyUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          if (state is LoginSuccess) {
            final email = state.decodedToken['email'];
            final firstName = state.decodedToken['firstName'];
            final lastName = state.decodedToken['lastName'];

            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: ProfileImagePicker(email: email,raduis: 56.w,),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('$firstName $lastName',
                          style: TextStyle(
                            fontFamily: 'Urbanist',
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                          )),
                      Text(
                        email.split('@')[0],
                        style: TextStyle(
                          color: const Color(0xff989797),
                          fontFamily: 'Urbanist',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      CustomBottonMenuBar(
                        widthBotton: 153.w,
                        heightBotton: 35.h,
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Padding(
                //   padding: const EdgeInsets.only(right: 5),
                //   child: ProfileImagePicker(email: email),
                // ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('',
                          style: TextStyle(
                            fontFamily: 'Urbanist',
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          )),
                      Text(
                        '',
                        style: TextStyle(
                          color: const Color(0xff989797),
                          fontFamily: 'Urbanist',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      CustomBottonMenuBar(
                        widthBotton: 153,
                        heightBotton: 35,
                      ),
                    ],
                  ),
                ),
              ],
            ); // ممكن تحط shimmer أو loader هنا لو حابة
          }
        },
      ),
    );
  }
}
