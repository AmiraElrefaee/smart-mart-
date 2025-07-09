import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_mart/features/profile/presentation/views/widgets/section_app_bar_profile.dart';
import 'package:smart_mart/features/profile/presentation/views/widgets/section_idetify_user.dart';

import '../../../../../core/utils/functions/app_router.dart';
import '../../../../home/presentation/views/widgets/custom_botton_menu_bar.dart';
import '../../../../home/presentation/views/widgets/section_identify.dart';
import '../../../../login/presentation/managers/login_cubit/login_cubit.dart';

class ProfilePageViewBody extends StatelessWidget {
  const ProfilePageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40,
        vertical: 30
      ),
      child: ListView(children: [
        SecttionAppBarProfile(),
        SectionIdentifyUser(),
        Padding(
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
        ),

      ],),
    );
  }
}

class CustomNameSection extends StatelessWidget {
  const CustomNameSection({
    super.key, required this.name,
  });
final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.center,
      width: 321.w,
      height: 43.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xffF8F8F8)
      ),
      child:Text(name,
    textAlign: TextAlign.center,
    style: TextStyle(fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      fontFamily: 'Urbanist'
    ),
    ) ,);
  }
}


