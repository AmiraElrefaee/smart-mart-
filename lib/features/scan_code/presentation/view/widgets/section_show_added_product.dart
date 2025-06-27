import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_mart/features/scan_code/presentation/view/widgets/section_payment_summary.dart';

import '../../../../../const.dart';
import '../../../../../core/domain/entities/scanned_product_model.dart';
import '../../../../../core/network/socket_service.dart';
import '../../../../../core/utils/functions/app_router.dart';
import '../../../../../core/widgets/custom_botton.dart';
import 'custom_app_bar.dart';
import 'custom_details_scanned_ittem.dart';
import 'custom_line.dart';

class SectionShowAddedProduct extends StatelessWidget {
  const SectionShowAddedProduct({
    super.key,
    required this.screenHeight,
    required GlobalKey<AnimatedListState> listKey,
    required List<Product> products,
    required this.screenWidth,
  })  : _listKey = listKey,
        _products = products;

  final double screenHeight;
  final GlobalKey<AnimatedListState> _listKey;
  final List<Product> _products;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      color: Colors.white,
      child: Stack(
        children: [
          Positioned.fill(
            child: CustomScrollView(
              slivers: [
                 SliverToBoxAdapter(
                  child: CustomAppBarCartPage(),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: screenHeight * 0.5,
                    child: AnimatedList(
                      key: _listKey,
                      physics: const NeverScrollableScrollPhysics(),
                      initialItemCount: _products.length,
                      itemBuilder: (context, index, animation) {
                        return SlideTransition(
                          position: animation.drive(
                            Tween<Offset>(
                              begin: const Offset(-1, 0),
                              end: Offset.zero,
                            ).chain(CurveTween(curve: Curves.easeInOut)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: screenWidth * 0.06,
                            ),
                            child: customDetailsSCannedItem(
                              index: index,
                              products: _products,
                              screenHeight: screenHeight,
                              screenWidth: screenWidth,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      customLine2(screenWidth: screenWidth),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 18, horizontal: 12),
                        width: screenWidth,
                        margin: EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: screenWidth * 0.06,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xffF8F8F8),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SectionPaymentSummary(
                          products: _products,
                          screenWidth: screenWidth,
                        ),
                      ),
                      const SizedBox(height: 80), // Space for fixed button
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: CustomBotton(
              text: 'Check out',
              background: kColor,
              colorText: Colors.white,
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              onTap: () {
                // SocketService().emitCheckout();
                context.push(AppRouter.kPayment);
              },
            ),
          ),
        ],
      ),
    );
  }
}
