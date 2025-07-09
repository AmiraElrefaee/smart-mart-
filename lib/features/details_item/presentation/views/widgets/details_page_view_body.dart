import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_mart/core/domain/entities/item_model.dart';
import 'package:smart_mart/features/details_item/presentation/views/widgets/section_arrow_back.dart';
import 'package:smart_mart/features/details_item/presentation/views/widgets/section_description_and_higlight.dart';
import 'package:smart_mart/features/details_item/presentation/views/widgets/section_open_link.dart';
import 'package:smart_mart/features/details_item/presentation/views/widgets/section_prices.dart';
import 'package:smart_mart/features/details_item/presentation/views/widgets/section_show_product_photo.dart';
import 'package:smart_mart/features/home/presentation/views/widgets/custom_search_bar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../const.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../category/data/models/sub_category_model.dart';
import '../../../../home/presentation/views/widgets/Custom_show_discount_item.dart';
import '../../../../home/presentation/views/widgets/Custom_show_item.dart';
import '../../../../home/presentation/views/widgets/custom_price.dart';
import '../../managers/similar_product_cubit/similar_product_cubit.dart';

class DetailsPageViewBody extends StatelessWidget {
  const DetailsPageViewBody({super.key, required this.item});

  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    // final state = GoRouterState.of(context);
    // final item = state.extra;

    if (item == null || item is! ItemModel) {
      return Scaffold(
        body: Center(
          child: Text(
            'حدث خطأ أثناء تحميل بيانات المنتج',
            style: TextStyle(color: Colors.red, fontSize: 18),
          ),
        ),
      );
    }
    final double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * .057,
          // vertical: screenWidth*.08
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Row(
                  children: [
                    sectonArrowBack(screenWidth: screenWidth),
                    SizedBox(
                        width: screenWidth * .77,
                        child: CustomSearchBar(
                            readOnly: true,
                            screenWidth: screenWidth)),
                  ],
                ),
              ),
              SectionShowProductPhoto(screenWidth: screenWidth,
                photo: item.image,
                id: item.id
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SectionOpenLink(
                      brand: item.brand,
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        margin: EdgeInsets.only(bottom: 10.w),
                        decoration: BoxDecoration(
                            color: Color(0xffDADADA),
                            borderRadius: BorderRadius.circular(8)
                        ),
                        child: Text(item.subCategoryName,
                          style: Styles.Urbanist16.copyWith(
                            fontSize: 14.sp
                          ),)),
                    Text(item.title,
                      style: Styles.Urbanist16.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          color: Colors.black
                      ),

                    ), Text('( ${item.itemWeight}gm )',
                      style: Styles.Urbanist16.copyWith(
                        color: Color(0xff484C52),
                        fontWeight: FontWeight.w600,
                        fontSize:16.sp,
                      ),),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: SectionPrices(
                        price: item.price,
                        discount: item.discount,
                      ),
                    ),
                  ],),
              ),

              SectionDEscriptionAndHighlight(screenWidth: screenWidth,
                Description: item.description,
                highlights: item.highlights,

              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text('Similar Products',
                  style: Styles.Urbanist25.copyWith(
                      fontSize: 20.sp
                  ),

                ),
              ),
              BlocBuilder<SimilarProductCubit, SimilarProductState>(
                builder: (context, state) {
                  if(state is SimilarProductSuccess){
                  return SizedBox(
                    height: 201.h,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.product.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: CustomShowDiscountItem(
                              screenWidth: screenWidth,
                              product: state.product[index],
                              width: 167.w,
                              hight: 201.h,
                              widhDiscount: 65.w,
                            ),
                          );
                        }
                    ),
                  );}
                  else if (state is SimilarProductLoading){
                    return Center(child: CircularProgressIndicator(color: kColor,));
                  } else{
                    return Text(' there is no similar product');
                  }

                },
              ),
              SizedBox(height: 150,)
            ],),


        ),


      ),


    );
  }

}

