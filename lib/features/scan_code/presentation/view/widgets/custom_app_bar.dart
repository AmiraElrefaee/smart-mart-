import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_mart/const.dart';
import 'package:smart_mart/core/network/socket_service.dart';

import '../../../../../core/utils/functions/app_router.dart';

class CustomAppBarCartPage extends StatelessWidget {
  const CustomAppBarCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    double ScreenWidth=MediaQuery.of(context).size.width;
    double ScreenHeight=MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(top: 50, right: 20,left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              context.go(AppRouter.kScanPage);
            },
            icon: const Icon(Icons.arrow_back_ios_new_sharp),
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Row(
                children: [
                  Text(
                    'Your Cart   ',
                    style: TextStyle(
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    '(  items )',
                    style: TextStyle(
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: Color(0xff989797),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.shopping_cart,
                    color: Color(0xff00CA25),
                  ),
                  Text(
                    '  connected to Basket',
                    style: TextStyle(
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: Color(0xff00CA25),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_horiz, color: Colors.black),
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(
                color: Color(0xFFD8DADC), // لون رمادي خفيف زي ما طلبتي
                width: 1, // عرض البوردر
              ),
            ),
            onSelected: (value) {
              if (value == 'disconnect') {
                showCustomDisconnectDialog(context,ScreenWidth);

                print('Disconnect Basket clicked');
              } else if (value == 'help') {
                print('Help clicked');
              } else if (value == 'setting') {
                print('Setting clicked');
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'disconnect',
                child: Container(
                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      // Icon(),
                      SvgPicture.asset('assets/icons/ant-design_disconnect-outlined.svg'),
                      const Text('  Disconnect Basket',
                      style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                      ),
                    ],
                  ),
                ),
              ),
              PopupMenuItem<String>(
                value: 'help',
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.help_outline,
                      size: 20,
                      ),
                      const Text('  Help',
                        style: TextStyle(
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              PopupMenuItem<String>(
                value: 'setting',
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.settings_outlined,
                      weight: .3,
                        size: 20,
                      ),
                      const Text('  Setting',
                        style: TextStyle(
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )



        ],
      ),
    );
  }
}


Future<void> showCustomDisconnectDialog(BuildContext context, double screenWidth) {
  return showDialog(
    context: context,
    builder: (context) => Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Are you sure you want to disconnect Basket?',
              style: TextStyle(
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w700,
                fontSize: screenWidth * .035,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'You’re about to disconnect your smart basket \nThis will stop automatic product scanning.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w500,
                fontSize: screenWidth * .03,
                color: const Color(0xff989797),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(screenWidth * .35, screenWidth *.11),
                shadowColor: Colors.transparent,
                backgroundColor: kColor,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                SocketService().emitStopCartScanning();
                // Navigator.pop(context);
                // context.go(AppRouter.kScanPage);

                print('stop scan emitted');
              },
              child: Text(
                'Yes, Disconnect',
                style: TextStyle(
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w600,
                  fontSize: screenWidth * .03,
                ),
              ),
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                fixedSize: Size(screenWidth *.35,screenWidth *.11 ),
                backgroundColor: Colors.white,
                side: const BorderSide(color: Color(0xffD8DADC), width: 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Cancel',
                style: TextStyle(
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w600,
                  fontSize: screenWidth * .03,
                  color: const Color(0xff484C52),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
