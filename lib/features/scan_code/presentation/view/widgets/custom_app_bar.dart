import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_mart/const.dart';
import 'package:smart_mart/core/network/socket_service.dart';

import '../../../../../core/utils/functions/app_router.dart';
import '../../managers/     scanned_product_socket/scanned_product_socket_cubit.dart';
import 'custom_app_bar_your_cart.dart';

class CustomAppBarCartPage extends StatelessWidget {
  const CustomAppBarCartPage({super.key, this.itemLength});
  final num ?itemLength   ;
  @override
  Widget build(BuildContext context) {
    double ScreenWidth=MediaQuery.of(context).size.width;
    double ScreenHeight=MediaQuery.of(context).size.height;
    return BlocBuilder<ScannedProductSocketCubit, ScannedProductSocketState>(
  builder: (context, state) {
    if (state is ScannedCartSucess ||state is ScannedProductsLoaded){
    return customAppBarYourCart(ScreenWidth: ScreenWidth,connect: true,
    itemLength: itemLength,
    );}
    else{
      return customAppBarYourCart(ScreenWidth: ScreenWidth,connect: false,);
    }
  }

  ,
);
  }
}

