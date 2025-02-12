import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_mart/features/home/presentation/views/widgets/custom_search_bar.dart';

import '../../../../../const.dart';
import '../../../../../core/utils/styles.dart';

class DetailsPageViewBody extends StatelessWidget {
  const DetailsPageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth=MediaQuery.of(context).size.width;
    return SafeArea(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: screenWidth*.07,
        vertical: screenWidth*.08
        ),
        child: Column(children: [
          Row(
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios_new_outlined,
              size: screenWidth*.06,
                color: Color(0xff484C52),
              )),
              SizedBox(
                width: screenWidth*.75,
                child:CustomSearchBar(screenWidth: screenWidth) ),
            ],
          ),



        ],),
      ),
    );
  }

}
