import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_mart/const.dart';
import 'package:smart_mart/features/profile/presentation/views/widgets/section_app_bar_profile.dart';
import 'package:smart_mart/features/profile/presentation/views/widgets/section_recet_products.dart';

import '../../../../../core/domain/entities/scanned_product_model.dart' show Product;
import '../../managers/details_product_recet/deatils_product_recet_cubit.dart';
import '../../managers/product_recet_cubit/product_recet_cubit.dart';

class PaymnetDetailsPageViewBody extends StatelessWidget {
  const PaymnetDetailsPageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40,
          vertical: 30
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        SecttionAppBarProfile(
          title: 'Payment Details',
        ),
        Padding(
          padding:  EdgeInsets.only(top:38.h,bottom: 15.h),
          child: Text('Your cart (3 Items )',
          style: TextStyle(
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.w600,
            fontSize: 16.sp
          ),

          ),
        ),
          BlocBuilder<DeatilsProductRecetCubit, DeatilsProductRecetState>(
  builder: (context, state) {
    if(state is DeatilsProductRecetLoading){
      return Center(child: CircularProgressIndicator(
        color: kColor,
      ));
    }
    else if (state is DeatilsProductRecetSuccess){
    return SectionRecetProducts(
            screenWidth: MediaQuery.of(context).size.width,
            screenHeight:MediaQuery.of(context).size.height ,
            products: state.order
          );}
    else{
      return Text('there is no items ');
    }
  },
),


          SizedBox(height: 80.h,),


      ],),
    );
  }
}
