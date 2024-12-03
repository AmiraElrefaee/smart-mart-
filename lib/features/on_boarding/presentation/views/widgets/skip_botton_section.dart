import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../const.dart';
import '../../../../../core/utils/functions/app_router.dart';
import '../../../../../core/utils/styles.dart';

class SkipBottonSection extends StatelessWidget {
  const SkipBottonSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        width: MediaQuery.of(context).size.width,
        top: MediaQuery.of(context).size.height * .91,
        child: InkWell(
            onTap: () {
              GoRouter.of(context).push(AppRouter.kloginPage);
            },
            child: Center(
              child: Text('Skip',
                style: Styles.Urbanist20.copyWith(
                    color: ksecodaryColor),
              ),
            )));
  }
}
