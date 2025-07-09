import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../const.dart';
import '../../../../../core/utils/functions/app_router.dart';
import '../../../../../core/utils/styles.dart';
import 'custom_side_title.dart';

class SectionTilteInGridCategory extends StatelessWidget {
  const SectionTilteInGridCategory({
    super.key,
    required this.screenWidth,
    required this.SideTitle,
    required this.numItems,
  });

  final double screenWidth;
  final String SideTitle;
  final int numItems;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: screenWidth * .08,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomSideTitle(
            screenWidth: screenWidth,
            text: '  $SideTitle',
            icon: 'assets/icons/Group 6.svg',
          ),
          numItems == 9 ? InkWell(
            onTap: () {
              GoRouter.of(context).push(
                AppRouter.kcategory,
                // extra: state.categories.length ??0,
              );
              // }

            },
            child: Text('view all',
              style: Styles.NexaLight16.copyWith(
                  color: kColor,
                  fontWeight: FontWeight.bold
              ),
            ),
          ) : Text(''),
        ],
      ),
    );
  }
}

