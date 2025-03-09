import 'package:flutter/cupertino.dart';

import '../../../../../const.dart';

class customPrices extends StatelessWidget {
  const customPrices({
    super.key, required this.title, required this.price, required this.kindMoney,
  });
  final String title ;
  final String kindMoney;
  final int  price;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: TextStyle(
                fontFamily: 'Urbanist',
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: Color(0xff484C52)
            )
        ),
        Text('$kindMoney $price',
            style: TextStyle(
                fontFamily: 'Urbanist',
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color:title=='Total'?kColor: Color(0xff484C52)
            )
        ),
      ],);
  }
}