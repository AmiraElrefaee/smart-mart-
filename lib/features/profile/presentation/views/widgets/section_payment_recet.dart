import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_mart/const.dart';

import '../../../../../core/utils/functions/Navigate_to_page.dart';
import '../../../../../core/utils/functions/app_router.dart';
import '../../managers/details_product_recet/deatils_product_recet_cubit.dart';
import '../../managers/product_recet_cubit/product_recet_cubit.dart';

class SectionpaymentsRecet extends StatelessWidget {
  const SectionpaymentsRecet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ProductRecetCubit, ProductRecetState>(
  builder: (context, state) {
    if(state is ProductRecetlaodind){
      return Center(child: CircularProgressIndicator(
        color: kColor,
      ));
    }
    else if (state is ProductRecetSuccess){
    return ListView.builder(
        itemCount: state.orders.length,
          itemBuilder: (context,index) {
         final  order=state.orders[index];
          return Column(
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 19.h),
                child: Text('${state.orders[index].createdAt}',
                  style: TextStyle(
                    fontSize:15.sp,
                    fontFamily: 'Urbanist',
                    color: Color(0xff666666),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                width: MediaQuery.of(context).size.width,

                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: Color(0xffD8DADC)
                    ),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      Text('Payment ID : ',
                        style: TextStyle(
                          fontSize:14.sp,
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.w600,
                          color: Color(0xff484C52),
                        ),
                      ),
                      Text('${order.paymentIntentId.substring(0, 10)}',
                        maxLines: 1,
                        overflow:TextOverflow.ellipsis,
                        style: TextStyle(

                          fontSize:14.sp,
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.w600,

                        ),
                      ),
                      Spacer(),
                      Text('3:45 PM',
                        style: TextStyle(
                          fontSize:15.sp,
                          fontFamily: 'Urbanist',
                          color: Color(0xff989797),
                        ),
                      ),

                    ],),
                    Padding(
                      padding:  EdgeInsets.symmetric(vertical: 13.h),
                      child: Text('${order.items[0].quantity}',

                        style: TextStyle(
                          fontSize:14.sp,
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.w600,
                          color: Color(0xff484C52),
                        ),
                      ),
                    ),

                    Container(width: MediaQuery.of(context).size.width,
                    height: 1,
                      color: Color(0xffD8DADC),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(top: 13.h
                      ),
                      child: Row(children: [
                        SizedBox(
                          width: 24.w,
                          height: 16.h,
                          child: CachedNetworkImage(
                            imageUrl: 'https://your-image-url.com/image.jpg', // ابدليه بالرابط الصحيح
                            // placeholder: (context, url) => Center(child:T),
                            errorWidget: (context, url, error) => Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Icon(Icons.error,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                        Text(' By Visa',

                        style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: 'Urbanist',
                          color: Color(0xff484C52),
                        ),),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 13.w),
                          height: 15.h,
                        width: 2,
                          color: Color(0xff989797),
                        ),
                        Text(' Total : ',

                          style: TextStyle(
                            fontSize: 12.sp,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w600,
                            color: Color(0xff484C52),
                          ),),
                        Text('${order.totalPrice} ',

                          style: TextStyle(
                            fontSize: 12.sp,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w600,
                            color:kColor,
                          ),),
                        Spacer(),
                        InkWell(
                          onTap: (){
                            // context.read<DeatilsProductRecetCubit>().fetchProducts(order: order);
                            // navigateToPage(AppRouter.kPaymentDetailsPageView,context);
                            context.pushNamed(
                              AppRouter.kPaymentDetailsPageView,
                              extra: order,
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 22.w,vertical: 8.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: kColor
                            ),
                            child: Text('View',
                              style: TextStyle(
                                  fontFamily: 'Urbanist',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white
                              ),
                            ),
                          ),
                        )
                      ],),
                    ),
                    // Spacer(),

                  ],
                ),
              ),
            ],
          );
        }
      );}
    else{
      return Center(child: Text('there is no paymnet history'));
    }

  },


),
    );
  }
}
