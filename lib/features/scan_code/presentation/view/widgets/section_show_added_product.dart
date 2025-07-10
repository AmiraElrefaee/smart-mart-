import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_mart/features/scan_code/presentation/view/widgets/section_payment_summary.dart';
import 'package:smart_mart/features/scan_code/presentation/view/widgets/section_show_similar_product.dart';

import '../../../../../const.dart';
import '../../../../../core/domain/entities/scanned_product_model.dart';
import '../../../../../core/network/make_payment.dart';
import '../../../../../core/network/socket_service.dart';
import '../../../../../core/utils/functions/app_router.dart';
import '../../../../../core/widgets/custom_botton.dart';
import '../../../../details_item/presentation/managers/similar_product_cubit/similar_product_cubit.dart';
import '../../../../home/presentation/views/widgets/Custom_show_discount_item.dart';
import 'custom_app_bar.dart';
import 'custom_details_scanned_ittem.dart';
import 'custom_line.dart';

class SectionShowAddedProduct extends StatelessWidget {
  const SectionShowAddedProduct({
    super.key,
    required this.screenHeight,
    required GlobalKey<AnimatedListState> listKey,
    required List<Product> products,
    required this.screenWidth,
  })  : _listKey = listKey,
        _products = products;

  final double screenHeight;
  final GlobalKey<AnimatedListState> _listKey;
  final List<Product> _products;
  final double screenWidth;
  num Total (){
    num totla=0 ;
    for (int i=0;i<_products.length; i++){
      if (_products[i].price!=null) {
        print('the price ${_products[i].price ??0} ');
        totla+=_products[i].price*_products[i].quantity ??0 ;
      }

    } return  totla;
  }
  num TotlaDiscont (){
    num totlaDiscont=0 ;
    for (int i=0;i<_products.length; i++){
      if (_products[i].duscount!=null) {
        print('the price ${_products[i].price ??0} ');
        totlaDiscont+=_products[i].price*(_products[i].duscount/100)*_products[i].quantity??0 ;
      }

    } return  totlaDiscont;
  }
  num totalPrice (){
    num totlaDiscont=0 ;
    return (Total()-TotlaDiscont());
  }
  num countProducts(){
    num count =0;
    for(int i=0 ; i<_products.length;i++){
      count+=_products[i].quantity;
    }
    return count;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CustomScrollView(
            slivers: [
               SliverToBoxAdapter(
                child: CustomAppBarCartPage(itemLength:countProducts() ,),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: screenHeight * 0.5,
                  child: AnimatedList(
                    key: _listKey,
                    physics: const NeverScrollableScrollPhysics(),
                    initialItemCount: _products.length,
                    itemBuilder: (context, index, animation) {
                      context.read<SimilarProductCubit>().fetchSimilarProducts(id: _products[index].id);
                      return SlideTransition(
                        position: animation.drive(
                          Tween<Offset>(
                            begin: const Offset(-1, 0),
                            end: Offset.zero,
                          ).chain(CurveTween(curve: Curves.easeInOut)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: screenWidth * 0.06,
                          ),
                          child: customDetailsSCannedItem(
                            index: index,
                            products: _products,
                            screenHeight: screenHeight,
                            screenWidth: screenWidth,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customLine2(screenWidth: screenWidth),
                      Text('Need This also ?',
                      style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp
                      ),
                      ),
                      SectionShowSimilarProduct(screenWidth: screenWidth),
                      SizedBox(height: 20,),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 18, horizontal: 12),
                        width: screenWidth,
                        // margin: EdgeInsets.symmetric(
                        //   vertical: 12,
                        //   horizontal: screenWidth * 0.06,
                        // ),
                        decoration: BoxDecoration(
                          color: const Color(0xffF8F8F8),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SectionPaymentSummary(
                          products: _products,
                          screenWidth: screenWidth,
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 34.w,vertical: 10.h),
                        child: CustomBotton(
                          text: 'Check out',
                          background: kColor,
                          colorText: Colors.white,
                          screenHeight: 26.h,
                          screenWidth: 299.w,
                          onTap: ()async {
                            // SocketService().emitStopCartScanning();
                            // SocketService().emitClearData();
                            await makePayment(
                              totalamount: _products.length.toString()
                              , // اكتبي القيمة الحقيقية هنا حسب حالتك
                              amount: totalPrice()*100,         // اكتبي القيمة الصحيحة بالفلسات (100 جنيه = 10000)
                            );
                            // context.push(AppRouter.kPayment);
                          },
                        ),
                      ),
                      const SizedBox(height: 100), // Space for fixed button
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

      ],
    );
  }
}

