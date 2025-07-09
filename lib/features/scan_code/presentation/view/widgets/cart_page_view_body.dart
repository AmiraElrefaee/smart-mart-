import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_mart/const.dart';
import 'package:smart_mart/features/scan_code/presentation/view/widgets/section_nothing_in_cart.dart';
import 'package:smart_mart/features/scan_code/presentation/view/widgets/section_payment_summary.dart';
import 'package:smart_mart/features/scan_code/presentation/view/widgets/section_show_added_product.dart';

import '../../../../../core/domain/entities/scanned_product_model.dart';
import '../../../../../core/utils/functions/app_router.dart';
import '../../../../../core/widgets/custom_botton.dart';
import '../../../../details_item/presentation/managers/similar_product_cubit/similar_product_cubit.dart';
import '../../managers/     scanned_product_socket/scanned_product_socket_cubit.dart';


import 'custom_details_scanned_ittem.dart';
import 'custom_line.dart';

class CartPageViewBody extends StatefulWidget {
  const CartPageViewBody({super.key});

  @override
  _CartPageViewBodyState createState() => _CartPageViewBodyState();
}

class _CartPageViewBodyState extends State<CartPageViewBody> {



  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return BlocConsumer<ScannedProductSocketCubit, ScannedProductSocketState>(
      listener: (context, state) {
        // if (state is ScannedProductsStopped ){
        //   context.go(AppRouter.kScanPage);
        // }
      },
      builder: (context, state) {
        if (state is ScannedProductsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ScannedProductsError) {
          return SizedBox(
            height: 500,
            width: 400,
            child: Center(child: Text('Error: ${state.message}')),
          );
        } else if (state is ScannedProductsLoaded ){

          print('  ${state.products.length}');
          return
            SectionShowAddedProduct(
            screenHeight: screenHeight,
            listKey: state.listKey,
            products: state.products,
            screenWidth: screenWidth,
          );
        }
        else{
          return  SectionNothingInCart();
        }
      }
    );
  }
}



