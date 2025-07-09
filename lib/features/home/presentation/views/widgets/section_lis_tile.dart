import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_mart/core/utils/functions/app_router.dart';

class SectionListTile extends StatelessWidget {
  const SectionListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width*.12),
      child: Column(children: [
        ListTile(

          leading: SvgPicture.asset('assets/icons/cart.svg'),
          title: Text('My cart',
            style: TextStyle(
                fontSize: 16.sp,

                color: Color(0xff484C52),
                fontWeight: FontWeight.w500
            ),
          ),
          onTap: () {
         context.go(AppRouter.kAddToCart);
          },
        ),
        ListTile(
          leading: SvgPicture.asset('assets/icons/payment.svg'),
          title:Text('Payment History',
            style: TextStyle(
                fontSize: 16.sp,
                color: Color(0xff484C52),
                fontWeight: FontWeight.w500
            ),
          ),
          onTap: () {},
        ),
        ListTile(
          leading:  SvgPicture.asset('assets/icons/Vector (9).svg',width: 21.w,),
          title:Text('Wislist',
            style: TextStyle(
                fontSize: 16.sp,
                color: Color(0xff484C52),
                fontWeight: FontWeight.w500
            ),
          ),
          onTap: () {
            context.go(AppRouter.kwhishList);
          },
        ),
        ListTile(
          leading: SvgPicture.asset('assets/icons/Notification.svg'),
          title:Text('Notification',
            style: TextStyle(
                fontSize: 16.sp,
                color: Color(0xff484C52),
                fontWeight: FontWeight.w500
            ),
          ),
          onTap: () {},
        ),
        ListTile(
          leading: SvgPicture.asset('assets/icons/settings.svg'),
          title:Text('Settings',
            style: TextStyle(
                fontSize: 16.sp,
                color: Color(0xff484C52),
                fontWeight: FontWeight.w500
            ),
          ),
          onTap: () {},
        ),
        ListTile(
          leading: SvgPicture.asset('assets/icons/support.svg'),
          title:Text('Support & Help',
            style: TextStyle(
                fontSize: 16.sp,
                color: Color(0xff484C52),
                fontWeight: FontWeight.w500
            ),
          ),
          onTap: () {},
        ),
      ],),
    );
  }
}