import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_mart/features/profile/presentation/views/widgets/section_app_bar_profile.dart';
import 'package:smart_mart/features/profile/presentation/views/widgets/section_idetify_user.dart';
import 'package:smart_mart/features/profile/presentation/views/widgets/section_option_profile.dart';

import '../../../../../core/utils/functions/app_router.dart';
import '../../../../home/presentation/views/widgets/custom_botton_menu_bar.dart';
import '../../../../home/presentation/views/widgets/section_identify.dart';
import '../../../../login/presentation/managers/login_cubit/login_cubit.dart';
import 'custom_name_section.dart';

class ProfilePageViewBody extends StatelessWidget {
  const ProfilePageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40,
        vertical: 30
      ),
      child: ListView(children: [
        SecttionAppBarProfile(
          title: 'Account',
        ),
        SectionIdentifyUser(),
        sectionObtionsProfile(),

      ],),
    );
  }
}

