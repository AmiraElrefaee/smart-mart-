import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../const.dart';
import '../../../../../core/utils/styles.dart';
import '../../managers/fetch_product_cubit/fetch_product_cubit.dart';
import 'Custom_show_discount_item.dart';
import 'custom_grid_best_sale.dart';
import 'custom_side_title.dart';

class SectionBestSale extends StatefulWidget {
  const SectionBestSale({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  State<SectionBestSale> createState() => _SectionBestSaleState();
}

class _SectionBestSaleState extends State<SectionBestSale> {
  bool ViewAll = false;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: EdgeInsets.only(right: widget.screenWidth * .08,),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomSideTitle(
              screenWidth: widget.screenWidth,
              text: ' Best Sale',
              icon: 'assets/icons/mdi_cart-sale.svg',
            ),

            InkWell(
              onTap: () {
                setState(() {
                  ViewAll = !ViewAll;
                });
              },
              child: Text('view all',
                style: Styles.NexaLight16.copyWith(
                    color: kColor,
                    fontWeight: FontWeight.bold
                ),
              ),
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 20, top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/icons/mdi_clock-outline.svg'),
            Text(' ends in 04',
              style: Styles.Urbanist16.copyWith(
                  color: Color(0xff484C52),
                  fontWeight: FontWeight.w600
              ),
            ),
            Text('H',
              style: Styles.Urbanist16.copyWith(
                  color: kColor,
                  fontWeight: FontWeight.w600
              ),
            ),
            Text(' : 16',
              style: Styles.Urbanist16.copyWith(
                  color: Color(0xff484C52),
                  fontWeight: FontWeight.w600
              ),
            ),
            Text('M',
              style: Styles.Urbanist16.copyWith(
                  color: kColor,
                  fontWeight: FontWeight.w600
              ),
            ),
            Text(' : 22',
              style: Styles.Urbanist16.copyWith(
                  color: Color(0xff484C52),
                  fontWeight: FontWeight.w600
              ),
            ),
            Text('S',
              style: Styles.Urbanist16.copyWith(
                  color: kColor,
                  fontWeight: FontWeight.w600
              ),
            )

          ],),
      ),

      Padding(
        padding: EdgeInsets.symmetric(horizontal: widget.screenWidth * .08),
        child: BlocBuilder<FetchProductCubit, FetchProductState>(
          builder: (context, state) {
            if (state is FetchProductSucces){
            return CustomGridBestSale(
              // widget: widget
              product: state.products,
                screenWidth: widget.screenWidth,
                scroll: false,
                ViewAll: ViewAll);}

            else if (state is FetchProductLoading){
              return CircularProgressIndicator(color: kColor);
            }  else {
              return Text('there is no offers ');
            }
          },
        ),)
    ],);
  }
}

