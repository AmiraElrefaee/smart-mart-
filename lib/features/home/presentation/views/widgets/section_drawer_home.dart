import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_mart/features/home/presentation/views/widgets/section_background_menu_bar.dart';
import 'package:smart_mart/features/home/presentation/views/widgets/section_identify.dart';
import 'package:smart_mart/features/home/presentation/views/widgets/section_lis_tile.dart';

import 'custom_botton_menu_bar.dart';

class SectionDrawerHome extends StatelessWidget {
  const SectionDrawerHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,// ممكن تحطي هنا أي تصميم يعجبك
      child: ListView(
        // padding: EdgeInsets.zero,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/images/Frame 1984078320.svg',
                width: MediaQuery.of(context).size.width*.12,
              ),
              SizedBox(
                height: 25,
              ),
              SectionIdentify(),

              CustomBottonMenuBar(),
              SectionListTile(),



            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 50,
                vertical: 10
            ),
            width: 1,
            height: 1,
            color: Color(0xffD9D9D9),
          ),
          SizedBox(height: 10,),
          SectionBackgroundMenuBar(),
          InkWell(
            onTap: (){},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/icons/goOut.svg'),
                SizedBox(width: 10,),
                Text('Log out',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff484C52)
                  ),
                )
              ],),
          ),
          SizedBox(height: 200,)

        ],
      ),
    );
  }
}


