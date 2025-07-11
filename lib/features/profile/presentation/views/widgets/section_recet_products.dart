import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_mart/features/profile/data/models.dart';

import '../../../../../const.dart';
import '../../../../../core/domain/entities/scanned_product_model.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../scan_code/presentation/view/widgets/custom_add_or_minus.dart';
import '../../../../scan_code/presentation/view/widgets/custom_photo_scanned_item.dart';
import 'Section_payment_summary.dart';

class SectionRecetProducts extends StatelessWidget {
  const SectionRecetProducts({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.products,
  });

  final OrderModel  products;
  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                final product = products.items[index];
                return Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// صورة المنتج
                        Padding(
                          padding: EdgeInsets.only(left: 10.w),
                          child: CustomPhotoScannedItem(
                            image:product.product.imageUrl,
                            index: index,
                            screenHeight: 68.h,
                            screenWidth: 61.w,
                          ),
                        ),

                        /// تفاصيل المنتج
                        Padding(
                          padding: EdgeInsets.only(
                            left: 20.w,
                            top: product.product.discount == 0 ? 15.h : 0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// العنوان
                              Text(
                                product.product.title,
                                style: Styles.NexaBold14.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                  color: Color(0xff484C52),
                                ),
                              ),

                              /// الوزن
                              Text(
                                '${product.product.itemWeight} gm',
                                style: Styles.NexaBold14.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                  color: Color(0xff484C52),
                                ),
                              ),

                              SizedBox(height: 4),

                              /// السعر والخصم
                              Row(
                                children: [
                                  Text(
                                    'EGP ${_getDiscountedPrice(product)}',
                                    style: TextStyle(
                                      fontFamily: 'Urbanist',
                                      fontSize: 14.sp,
                                      color: kColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  if (product.product.discount != 0)
                                    Text(
                                      'EGP ${product.price}',
                                      style: TextStyle(
                                        decoration:
                                        TextDecoration.lineThrough,
                                        fontFamily: 'Urbanist',
                                        fontSize: 14.sp,
                                        color: Color(0xff989797),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                ],
                              ),

                              SizedBox(height: 10),
                            ],
                          ),
                        ),

                        /// زر الزيادة والنقصان
                        Spacer(),
                        Padding(
                          padding:
                          EdgeInsets.only(top: screenWidth * 0.05),
                          child: CustomAddOrMinusBotton(
                            number: product.quantity,
                            screenHeight: 32,
                            screenWidth: screenWidth * 0.13,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 17.h),
                      width: 302.w,
                      height: 1,
                      color: Color(0xffDADADA),
                    )
                  ],
                );
              },
              childCount: products.items.length,
            ),
          ),

          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text('Payment summary',
                style: TextStyle(
                    fontSize: 20.sp,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w600
                ),),
                SizedBox(height: 10.h,),
                sectionPaymentSummary(
                  title1: 'Payment ID',
                  title2:'#23421' ,
                ),
                sectionPaymentSummary(
                  title1: 'Date',
                  title2:'#23421' ,
                ), sectionPaymentSummary(
                  title1: 'Subtotal',
                  title2:'#23421' ,
                ), sectionPaymentSummary(
                  title1: 'Discount',
                  title2:'#23421' ,
                ),
                sectionPaymentSummary(
                  title1: 'Paid by',
                  title2:'#23421' ,
                ),
            ],)
          ),
        ],
      ),
    );
  }

  /// دالة لحساب السعر بعد الخصم
  String _getDiscountedPrice(OrderItemModel product) {
    final discountValue = product.product.price * (product.product.discount / 100);
    final finalPrice = product.product.price - discountValue;
    return finalPrice.toStringAsFixed(2);
  }
}

