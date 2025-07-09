import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_mart/const.dart';
import 'package:smart_mart/features/category/presentation/managers/product_sub_category_cubit/product_sub_category_cubit.dart';
import 'package:smart_mart/features/category/presentation/views/widgets/section_bottons.dart';
import 'package:smart_mart/features/category/presentation/views/widgets/section_list_details_category.dart';

import '../../../../home/presentation/views/widgets/custom_grid_best_sale.dart';

class SectionDetailsBottons extends StatelessWidget {
  const SectionDetailsBottons({
    super.key, required this.name,

  });

  final String name;

  @override
  Widget build(BuildContext context) {
    print(' the sub categort : $name');
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,
          vertical: 20
      ),
      child: BlocBuilder<ProductSubCategoryCubit, ProductSubCategoryState>(
        builder: (context, state) {
          if(state is ProductSubCategoryLaoding){
            return CircularProgressIndicator(color: kColor,);
          }
          else if(state is ProductSubCategorySuccess ){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(name,
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600
                ),

              ),
              SectionBottons(),
              SizedBox(height: 20,),
              CustomGridBestSale(
                ViewAll: true,
                screenWidth: MediaQuery.of(context).size.width,
                scroll: false,
                product:state.product,
              ),

              SizedBox(height: 100,)


            ],);}
          else{
            return Text(' thers is no product for this sub category yet',
            style: TextStyle(

              fontSize: 15.sp
            ),
            );
          }
        },
      ),
    );
  }
}


