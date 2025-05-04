import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_mart/features/scan_code/presentation/view/widgets/cart_page_view_body.dart';

import '../managers/     scanned_product_socket/scanned_product_socket_cubit.dart';

class CartPageView extends StatelessWidget {
  const CartPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CartPageViewBody(),
    );
  }
}
