import 'package:flutter/cupertino.dart';
import 'package:smart_mart/features/scan_code/presentation/view/widgets/section_show_scanned_item.dart';


import '../../../../../core/domain/entities/scanned_product_model.dart';
import 'custom_line.dart';
import 'custom_prices.dart';

class SectionPaymentSummary extends StatelessWidget {
  const SectionPaymentSummary({
    super.key,
    required this.screenWidth,
    required this.products,
  });

  final double screenWidth;

  final List<Product> products;

  num Total (){
    num totla=0 ;
    for (int i=0;i<products.length; i++){
      if (products[i].price!=null) {
        print('the price ${products[i].price ??0} ');
        totla+=products[i].price*products[i].quantity ??0 ;
      }

    } return  totla;
  }
  num TotlaDiscont (){
    num totlaDiscont=0 ;
    for (int i=0;i<products.length; i++){
      if (products[i].duscount!=null) {
        print('the price ${products[i].price ??0} ');
        totlaDiscont+=products[i].price*(products[i].duscount/100)*products[i].quantity??0 ;
      }

    } return  totlaDiscont;
  }
  num totalPrice (){
    num totlaDiscont=0 ;
   return (Total()-TotlaDiscont());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Text('Payment summary',
            style: TextStyle(
                fontFamily: 'Urbanist',
                fontSize: 17,
                fontWeight: FontWeight.w600
            ),),
        ),
        customPrices(
          title: 'Subtotal',
          kindMoney: 'EGP',
          price: Total(),
        ),
        SizedBox(height: 15,),
        customPrices(
          title: 'Discount',
          kindMoney: '-EGP',
          price: TotlaDiscont(),
        ),


        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Center(child: customLine2(screenWidth: screenWidth)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),

          child: customPrices(
            title: 'Total',
            kindMoney: 'EGP',
            price: totalPrice() ?? 0 ,
          ),

        )

      ],
    );
  }
}
