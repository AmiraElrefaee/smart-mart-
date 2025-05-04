import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
                fontSize: 16,

                color: Color(0xff484C52),
                fontWeight: FontWeight.w500
            ),
          ),
          onTap: () {
            // اعملي تنقل أو حاجة هنا
          },
        ),
        ListTile(
          leading: SvgPicture.asset('assets/icons/payment.svg'),
          title:Text('Payment History',
            style: TextStyle(
                fontSize: 16,
                color: Color(0xff484C52),
                fontWeight: FontWeight.w500
            ),
          ),
          onTap: () {},
        ),
        ListTile(
          leading:  SvgPicture.asset('assets/icons/Vector (9).svg'),
          title:Text('Wislist',
            style: TextStyle(
                fontSize: 16,
                color: Color(0xff484C52),
                fontWeight: FontWeight.w500
            ),
          ),
          onTap: () {},
        ),
        ListTile(
          leading: SvgPicture.asset('assets/icons/Notification.svg'),
          title:Text('Notification',
            style: TextStyle(
                fontSize: 16,
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
                fontSize: 16,
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
                fontSize: 16,
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