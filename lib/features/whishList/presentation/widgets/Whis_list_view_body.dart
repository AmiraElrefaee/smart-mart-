import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_mart/const.dart';
import 'package:smart_mart/features/whishList/presentation/widgets/section_top_bar.dart';

import '../managers/whish_list_cubit/whish_list_cubit.dart';
import 'custom_loved_item.dart';

class WhisListViewBody extends StatelessWidget {
  const WhisListViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    Future.microtask(() {
      context.read<WhishListCubit>().ShowWhishList();
    });

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SectionTopBarWhisList(ScreenWidht: screenWidth),
            ),

            BlocBuilder<WhishListCubit, WhishListState>(
           builder: (context, state) {
             if (state is GetWhishListItem){
           return SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: customLovedItem(ScreenWidht: screenWidth,
                  items: state.items[index],
                    key: ValueKey(state.items[index].id),
                  ),
                ),
                childCount: state.items.length,
              ),
            ); }

             else if(state is WhishListLoading){
               return SliverToBoxAdapter(
                 child: Padding(
                   padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*.4),
                   child: Column(
                     children: [
                       CircularProgressIndicator(color: kColor,),
                     ],
                   ),
                 ),
               );
             }
             else{
               return SliverToBoxAdapter(
                 child: Center(child: Text('The Whish List is empty ')),
               );
             }
  },
),

            SliverToBoxAdapter(
              child: SizedBox(height: 100.h),
            ),
          ],
        ),
      ),
    );
  }
}
