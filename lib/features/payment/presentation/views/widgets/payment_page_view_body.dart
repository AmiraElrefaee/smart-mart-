import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_mart/const.dart';
import 'package:smart_mart/features/payment/presentation/views/widgets/section_bottons_ad_new.dart';
import 'package:smart_mart/features/payment/presentation/views/widgets/section_my_cart.dart';

import '../../../../../core/utils/functions/Navigate_to_page.dart';
import '../../../../../core/utils/functions/app_router.dart';
import '../../../../scan_code/presentation/view/widgets/custom_photo_scanned_item.dart';
import '../../../data/models/bank_photos.dart';
import 'Custom_bottons_bank.dart';
import 'custom_title_payment_method.dart';

class PaymentPageViewBody extends StatelessWidget {
  const PaymentPageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth=MediaQuery.of(context).size.width;
    double screenHeight=MediaQuery.of(context).size.height;
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal:screenWidth*.06,
      vertical: screenWidth*.05
      ),
      child:ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Padding(
          padding:  EdgeInsets.only(left: screenWidth*.02
          ,bottom: 5
          ),
          child:
              SectionMyCart(screenWidth: screenWidth, screenHeight: screenHeight),),
              Container(
                margin: EdgeInsets.symmetric(vertical: 30),
                height: 1,
                width: screenWidth*.8,
                color: Color(0xffD9D9D9),

              ),

            const  Text('Choose Payment Method',

              style: TextStyle(
                fontFamily: 'Urbanist',
                fontSize: 20,
                fontWeight: FontWeight.w600

              ),),


              SizedBox(height: 10,),


              CustomSideTitlePayemtMethod(title: 'Saved cards',),
              SizedBox(height: 10,),
              CustomBottonsBank(screenWidth: screenWidth, screenHeight: screenHeight,
              color: Color(0xffF8F8F8),
                onTap: (){},
                title: 'xxxx xxxx xxxx 3945',
                photo: 'assets/payment_icons/image 59.png',
              ),

              SectionBottonsAddNew(screenWidth: screenWidth, screenHeight: screenHeight),

              CustomSideTitlePayemtMethod(
                title: 'Payment methods',
              ),
              SizedBox(height: 10,),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: 4,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context,index){

                return
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: CustomBottonsBank(screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      color: Colors.white,
                      title: 'Pay through debit card',
                      photo: photosBank[index].photo,
                    ),
                  )
                  ;
              }),

              CustomSideTitlePayemtMethod(title: 'other',),
              SizedBox(height: 10,),
              CustomBottonsBank(
                onTap: (){
                  navigateToPage(AppRouter.kaddCartCard, context);
                },
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                color: Colors.white,
                title: 'Pay through debit card',
                photo: 'assets/payment_icons/Cash in Hand.png',
              ),


            ],
          ),
        ],
      ),
    );
  }
}


