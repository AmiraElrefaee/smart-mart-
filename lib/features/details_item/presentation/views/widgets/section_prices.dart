import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../const.dart';
import '../../../../../core/utils/styles.dart';

class SectionPrices extends StatelessWidget {
  const SectionPrices({
    super.key, required this.price, required this.discount,
  });
final num price;
final num discount;
num Total(){
  num Totalprice =price-(price*(discount/100));
  return Totalprice;
}
  @override
  Widget build(BuildContext context) {
    return Row(

      children: [
        Text('${Total()}',
          style: Styles.Urbanist25.copyWith(
              color: kColor,
              fontWeight: FontWeight.w700,
              fontSize: 36.sp
          ),
        ),
        Column(children: [
          Text('.00',
            style: Styles.Urbanist16.copyWith(
              fontSize: 14.sp,
              color: kColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(' EGP',
            style: Styles.Urbanist16.copyWith(
              fontSize: 10.sp,
            ),
          )
        ],),

        discount!=0? Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text('  EGP $price  ',
            style: Styles.Urbanist12.copyWith(
                fontSize: 15,
                decoration: TextDecoration.lineThrough,
                color: Color(0xffA5A5A5)
            ),),
        ):Text(''),
        Spacer(),
       discount!=0? Container(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 6),
            margin: EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
                color: Color(0xff72FC97),
                borderRadius: BorderRadius.circular(10)
            ),
            child: Text('$discount% OFF',
              style: TextStyle(
                  color: Color(0xff484C52),
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w700
              ),
            )):Text(''),
      ],);
  }
}

