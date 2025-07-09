import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../const.dart';
import '../../managers/save_search_cubit/save_search_cubit.dart';
import '../../managers/search_cubit/search_cubit.dart';

class CustomVrialItem extends StatelessWidget {
  const CustomVrialItem({super.key, required this.Item});

  final List Item;

  final int maxRows = 2;

  final int itemsPerRow = 3;

  @override
 //
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<SaveSearchCubit, SaveSearchState>(
      builder: (context, state) {

        if(state is SearchRecent){
          final recent = state.recentSearches;
          final int maxItems = maxRows * itemsPerRow;
          final itemsToShow = recent.take(maxItems).toList();

          return Wrap(
          spacing: 10.0,
          runSpacing: 10.0,
          children: List.generate(itemsToShow.length, (index) {
            return InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 10, horizontal: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 1, color: kcolor4),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      FontAwesomeIcons.clockRotateLeft,
                      color: kcolor4,
                      size: 15.w,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '${state.recentSearches[index]}',
                      style:  TextStyle(
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: kcolor4,
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
        );}
        else{
         return Text(
           'there is no recent data',
            style: const TextStyle(
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.w500,
              fontSize: 15,
              color: kcolor4,
            ),
          );
        }
      },
    );
  }
}
