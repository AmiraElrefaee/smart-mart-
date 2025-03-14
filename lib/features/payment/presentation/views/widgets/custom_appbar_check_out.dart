import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBarCheckOut extends StatelessWidget {
  const CustomAppBarCheckOut({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent, // Transparent to keep Container color
      elevation: 0, // No extra shadow from AppBar itself
      scrolledUnderElevation: 0, // Disable auto-shadow on scroll
      centerTitle: true,
      title: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: const Text(
          'Checkout',
          style: TextStyle(
            fontFamily: 'Urbanist',
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black, // Ensuring text color consistency
          ),
        ),
      ),
      leading: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
      ),
    );
  }
}
