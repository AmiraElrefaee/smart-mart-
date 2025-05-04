import 'package:flutter/cupertino.dart';

import '../../../../../const.dart';
import '../../../../../core/utils/styles.dart';

class SectionPrices extends StatelessWidget {
  const SectionPrices({
    super.key, required this.price, required this.discount,
  });
final num price;
final num discount;
  @override
  Widget build(BuildContext context) {
    return Row(

      children: [
        Text('$price',
          style: Styles.Urbanist25.copyWith(
              color: kColor,
              fontWeight: FontWeight.w700,
              fontSize: 36
          ),
        ),
        Column(children: [
          Text('.00',
            style: Styles.Urbanist16.copyWith(
              fontSize: 14,
              color: kColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(' EGP',
            style: Styles.Urbanist16.copyWith(
              fontSize: 10,
            ),
          )
        ],),

        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text('  EGP 90,20  ',
            style: Styles.Urbanist12.copyWith(
                fontSize: 15,
                decoration: TextDecoration.lineThrough,
                color: Color(0xffA5A5A5)
            ),),
        ),
        Spacer(),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 6),
            margin: EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
                color: Color(0xff72FC97),
                borderRadius: BorderRadius.circular(10)
            ),
            child: Text('20% OFF',
              style: TextStyle(
                  color: Color(0xff484C52),
                  fontSize: 16,
                  fontWeight: FontWeight.w700
              ),
            ))
      ],);
  }
}

