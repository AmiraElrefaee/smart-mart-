import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../const.dart';
import '../../../../../core/domain/entities/scanned_product_model.dart';
import '../../../../../core/utils/styles.dart';

import 'custom_add_or_minus.dart';
import 'custom_photo_scanned_item.dart';

class customDetailsSCannedItem extends StatelessWidget {
  const customDetailsSCannedItem({
    super.key,
    required this.screenHeight,
    required this.screenWidth,

    required this.index, required this.products
  });
 final  int index;
  final  List<Product>  products;
  final double screenHeight;
  final double screenWidth;
  num discount(int index) {
    final num price = products[index].price ?? 0;
    final num discount = products[index].duscount ??0 ;

    final num priceAfterDis =
    (price - (price * (discount / 100)));

    print('the disconnnnt  ✅✅✅✅✅✅✅ $priceAfterDis');
    return priceAfterDis;
  }

  @override
  Widget build(BuildContext context) {
    print(' in ${products.length} ✅✅✅✅✅✅✅');
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Padding(
          padding:  EdgeInsets.only(left: 10.w),
          child: CustomPhotoScannedItem(
            image: products[index].itemWeight,
              index: index,
              screenHeight: screenHeight*.11,
              screenWidth: screenWidth*.18),
        ),
        Padding(
          padding:  EdgeInsets.only(left: 20.w,top: products[index].duscount ==0 ?15.h:0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text('${products[index].title}'
                // products[index].id
                ,
                style: Styles.NexaBold14.copyWith(
                    fontWeight: FontWeight.w500,
                  fontSize: 14.sp
                ),

              ),
              Text(
                  '${products[index].itemWeight}  gm'

                ,
                style: Styles.NexaBold14.copyWith(
                    fontWeight: FontWeight.w500,
                  fontSize: 14.sp

                ),),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('EG ${discount(index)}'

                    ,
                    style: TextStyle(
                        fontFamily: 'Urbanist'
                        ,fontSize: 14.sp,
                        color: kColor,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  products[index].duscount !=0?Text('EGP ${products[index].price}'
                    , style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      fontFamily: 'Urbanist'
                      ,fontSize: 14.sp,
                      color: Color(0xff989797),
                      fontWeight: FontWeight.w600,

                    ),
                  ) :Text(''),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              products[index].duscount !=0?Container(
                alignment: Alignment.center,
                width: 60.w,
                height: 23.h,
                decoration: BoxDecoration(
                    color: Color(0xff72FC97),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Text('${products[index].duscount}% OFF',
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Urbanist',
                ),
                ),
              ) :SizedBox(),


              // CustomPrice(screenWidth: screenWidth),
              // SizedBox(height: 10,)

            ],),
        ),
        Spacer(),
        Padding(
          padding:  EdgeInsets.only(top: screenWidth*.05),
          child: CustomAddOrMinusBotton(
            number: products[index].quantity,
            screenHeight:32,
            screenWidth: screenWidth*.13,
          ),
        )

      ],
    );
  }
}

