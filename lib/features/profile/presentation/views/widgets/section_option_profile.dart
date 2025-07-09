import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/functions/Navigate_to_page.dart';
import '../../../../../core/utils/functions/app_router.dart';
import 'custom_name_section.dart';

class sectionObtionsProfile extends StatelessWidget {
  const sectionObtionsProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(children: [
        CustomNameSection(name: 'Account info',),
        ListTile(
          trailing: Icon(Icons.arrow_forward_ios_rounded, size: 20, color: Color(0xff484C52)),

          leading: SvgPicture.asset('assets/icons/li_user.svg'),
          title:Text('Personal information',
            style: TextStyle(
                fontSize: 16.sp,
                color: Color(0xff484C52),
                fontWeight: FontWeight.w500
            ),
          ),
          onTap: () {},
        ),


        ListTile(
          trailing: Icon(Icons.arrow_forward_ios_rounded, size: 20, color: Color(0xff484C52)),

          leading: SvgPicture.asset('assets/icons/payment.svg'),
          title:Text('Saved Cards',
            style: TextStyle(
                fontSize: 16.sp,
                color: Color(0xff484C52),
                fontWeight: FontWeight.w500
            ),
          ),
          onTap: () {},
        ),
        ListTile(
          leading: SvgPicture.asset('assets/icons/cart.svg'),
          trailing: Icon(Icons.arrow_forward_ios_rounded, size: 20, color: Color(0xff484C52)),
          title: Text('cart',
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
          trailing: Icon(Icons.arrow_forward_ios_rounded, size: 20, color: Color(0xff484C52)),

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
          trailing: Icon(Icons.arrow_forward_ios_rounded, size: 20, color: Color(0xff484C52)),
          leading:  SvgPicture.asset('assets/icons/gift.svg',width: 21.w,
            color: Color(0xff484C52),),
          title:Text('Rewards',
            style: TextStyle(
                fontSize: 16.sp,
                color: Color(0xff484C52),
                fontWeight: FontWeight.w500
            ),
          ),
          onTap: () {

          },
        ),
        ListTile(
          trailing: Icon(Icons.arrow_forward_ios_rounded, size: 20, color: Color(0xff484C52)),
          leading: Icon(FontAwesomeIcons.history,
            color: Color(0xff484C52),
            size: 19,
          ),
          title:Text('Order History',
            style: TextStyle(
                fontSize: 16.sp,
                color: Color(0xff484C52),
                fontWeight: FontWeight.w500
            ),
          ),
          onTap: () {
            navigateToPage(AppRouter.kpaymentHistoy,context);
            // context.go(AppRouter.kpaymentHistoy);
          },
        ),
        CustomNameSection(name: 'Help',),


        ListTile(
          trailing: Icon(Icons.arrow_forward_ios_rounded, size: 20, color: Color(0xff484C52)),

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
          trailing: Icon(Icons.arrow_forward_ios_rounded, size: 20, color: Color(0xff484C52)),

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
        ListTile(
          trailing: Icon(Icons.arrow_forward_ios_rounded, size: 20, color: Color(0xff484C52)),

          leading:Icon(Icons.info_outline),
          title:Text('About app',
            style: TextStyle(
                fontSize: 16.sp,
                color: Color(0xff484C52),
                fontWeight: FontWeight.w500
            ),
          ),
          onTap: () {},
        ),
        CustomNameSection(name: 'Preference',),
        ListTile(
          trailing: Icon(Icons.arrow_forward_ios_rounded, size: 20, color: Color(0xff484C52)),

          leading:Icon(Icons.language),
          title:Text('Language',
            style: TextStyle(
                fontSize: 16.sp,
                color: Color(0xff484C52),
                fontWeight: FontWeight.w500
            ),
          ),
          onTap: () {},
        ),
        ListTile(
          trailing: Icon(Icons.arrow_forward_ios_rounded, size: 20, color: Color(0xff484C52)),

          leading:SvgPicture.asset('assets/icons/Notification.svg'),
          title:Text('Notification',
            style: TextStyle(
                fontSize: 16.sp,
                color: Color(0xff484C52),
                fontWeight: FontWeight.w500
            ),
          ),
          onTap: () {},
        ),
        SizedBox(height: 100,)
      ],),
    );
  }
}

