import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/functions/Navigate_to_page.dart';
import '../../../../../core/utils/functions/app_router.dart';
import '../../../../home/presentation/views/widgets/custom_search_bar.dart';

class customTopBar extends StatelessWidget {
  const customTopBar({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(
          top: 30,
          bottom: 20,
          right: 20,
          left: screenWidth*.08

      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 0),
            child: InkWell(onTap: (){GoRouter.of(context).pop();

            }, child: Icon(Icons.arrow_back_ios,
              size: 25,
              color: Color(0xff484C52),
            )),
          ),
          Expanded(
            child: CustomSearchBar(
              onTap: (){
                navigateToPage(AppRouter.kSearch, context);

              },
              readOnly: true,
              screenWidth: screenWidth,
            ),
          ),
        ],),);
  }
}
