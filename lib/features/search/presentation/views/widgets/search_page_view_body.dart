import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_mart/const.dart';
import 'package:smart_mart/features/home/presentation/views/widgets/custom_search_bar.dart';
import 'package:smart_mart/features/search/presentation/views/widgets/section_body.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../home/data/models/categories_item.dart';
import '../../../../home/presentation/views/widgets/Custom_show_item.dart';
import '../../managers/search_cubit/search_cubit.dart';
import 'Section_body_when_searching.dart';

class SearchPageViewBody extends StatefulWidget {
  const SearchPageViewBody({super.key});

  @override
  State<SearchPageViewBody> createState() => _SearchPageViewBodyState();
}

class _SearchPageViewBodyState extends State<SearchPageViewBody> {
  bool search =true;
  @override
  Widget build(BuildContext context) {

   // FontAwesomeIcons.clockRotateLeft
    final double screenWidth=MediaQuery.of(context).size.width;
    final double screenHeight=MediaQuery.of(context).size.height;
    return Padding(
      padding:  EdgeInsets.only(left:  screenWidth*.08),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 30,
              bottom: 20,
              right: 20,
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
                      onChanged: (value){
                        setState(() {
                          search = value.isEmpty;
                          context.read<SearchCubit>().FetchSearchProduct(keyords: value);
                        });

                      },
                      readOnly: false,
                      screenWidth: screenWidth,

                    onTap: (){},),
                  ),
                ],
              ),),

       search==true? SectionBody(
            // trendintItem: trendintItem,
            // RecentItem: RecentItem,
            screenWidth: screenWidth):SectionBodyWhenSearching(),


            SizedBox(height: 150,)

          ]),
      )
    )
    ;}
}



