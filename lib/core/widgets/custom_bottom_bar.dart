import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_mart/const.dart';

import '../utils/functions/app_router.dart';
import '../utils/styles.dart';
import 'custom_floating_action_botton.dart';

class CustomBottomBar extends StatefulWidget {

  const CustomBottomBar({
    super.key,
  });

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*.125, // ارتفاع البار السفلي
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/Subtract.png', // صورة الخلفية
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavItem(
                  iconPath: 'assets/icons/Vector (6).svg',
                  label: 'Home',
                  index: 0,
                  selectedIndex: selectedIndex,
                  onTap: (){
                    setState(() {
                      selectedIndex=0;
                    });

                    context.go(AppRouter.khome);
                  } ,
                ),
                const Spacer(flex: 1),
                _buildNavItem(
                  iconPath: 'assets/icons/Vector (9).svg',
                  label: 'Wishlist',
                  index: 1,
                  selectedIndex: selectedIndex,
                  onTap: () {

                    setState(() {
                      selectedIndex=1;
                    });
                    context.go('/favorites');
                  },
                ),

                const Spacer(flex: 4),
                _buildNavItem(
                  iconPath: 'assets/icons/Vector (7).svg',
                  label: 'Cart',
                  index: 2,
                  selectedIndex: selectedIndex,
                  onTap: () {
                    setState(() {
                      selectedIndex=2;
                    });
                    context.go('/cart');

                  },
                ),
                const Spacer(flex: 1),
                _buildNavItem(
                    iconPath: 'assets/icons/li_user.svg',
                    label: 'Profile',
                    index: 3,
                    selectedIndex: selectedIndex,
                    onTap: () {
                      setState(() {
                        selectedIndex=3;
                      });
                      context.go('/profile');
                    }
                ),
              ],
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height*.02, // رفعه فوق البار السفلي
            left: MediaQuery.of(context).size.width / 1.95 - 40, // توسيطه
            child:   CustomFloatingActionButton(
              onItemTapped: (){
                setState(() {
                  selectedIndex=5;
                });
                context.go(AppRouter.kScanPage);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required String iconPath,
    required String label,
    required int index,
    required int selectedIndex,
    required VoidCallback onTap,
  }) {
    final bool isSelected = selectedIndex == index;
    final Color iconColor = isSelected ? kColor : const Color(0xff484C52);
    final textStyle = TextStyle(
      color: iconColor,
      fontSize: 10,
      fontWeight: FontWeight.w500,
    );

    return IconButton(
      onPressed: onTap,
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            iconPath,
            color: iconColor,
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: textStyle,
          ),
        ],
      ),
    );
  }
}
