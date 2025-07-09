import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_mart/features/login/presentation/managers/login_cubit/login_cubit.dart';

import '../../../../../const.dart';
import '../../../../../core/utils/styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.screenWidth,
    required this.scaffoldContext
    // , required this.token,
  });

  final double screenWidth;
  final BuildContext scaffoldContext;
  // final Map<String , dynamic> token ;

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        InkWell(
          onTap: () {
            Scaffold.of(scaffoldContext).openDrawer();
          },
          child: SvgPicture.asset(
            'assets/icons/Vector (1).svg',
            width: screenWidth * .05,
          ),
        ),
        Spacer(),
        Column(
          children: [
            Row(
              children: [
                Text('Hi ,', style: Styles.NexaBold20),

    BlocBuilder<LoginCubit, LoginState>(
    builder: (context, state) {
    if (state is LoginSuccess) {
    return Text(' ${state.decodedToken['firstName']}',
        style: Styles.NexaBold20.copyWith(color: kColor)

    );
    } else {
    return Text('');
    }
    },
    )

    ]
            ),
          ],
        ),
        Spacer(),
        InkWell(
          onTap: () {},
          child: SvgPicture.asset(
            'assets/icons/shape.svg',
            width: screenWidth * .05,
          ),
        ),
      ],
    );
  }
}
