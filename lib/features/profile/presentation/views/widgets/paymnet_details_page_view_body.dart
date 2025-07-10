import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_mart/features/profile/presentation/views/widgets/section_app_bar_profile.dart';
import 'package:smart_mart/features/profile/presentation/views/widgets/section_recet_products.dart';

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
          // SectionRecetProducts(
          //   screenWidth: MediaQuery.of(context).size.width,
          //   screenHeight:MediaQuery.of(context).size.height ,
          //   products: [],
          // )

      ],),
    );
  }
}
