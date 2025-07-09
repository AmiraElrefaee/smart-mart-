import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_mart/const.dart';

import '../../../../../core/utils/functions/app_router.dart';
import '../../managers/save_search_cubit/save_search_cubit.dart';
import '../../managers/search_cubit/search_cubit.dart';

class SectionBodyWhenSearching extends StatelessWidget {
  const SectionBodyWhenSearching({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if(state is SearchLoading){
          return Center(child: CircularProgressIndicator(color: kColor,));
        }
        else if (state is SearchSuccess){
        return SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            itemCount: state.Items.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    context.read<SaveSearchCubit>().saveToRecent(state.Items[index].title);
                    context.read<SaveSearchCubit>().loadRecentSearch();
                    GoRouter.of(context).push(AppRouter.kdetails,
                        extra: state.Items[index]
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20,bottom: 20),
                    child: Row(

                      children: [
                        SvgPicture.asset(
                            'assets/icons/icon-park-outline_search.svg',height: 19.h,),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(state.Items[index].title,
                            style: TextStyle(
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w700,
                                fontSize: 14.sp,
                                color: kcolor4
                            ),
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward,
                          size: 17.w,
                        ),
                      ],
                    ),
                  ),
                );
              }),
        );}
        else{
         return Text(' this item is not therse',
            style: TextStyle(
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w700,
                fontSize: 17,
                color: kcolor4
            ),
          );
        };
      },
    );
  }
}
