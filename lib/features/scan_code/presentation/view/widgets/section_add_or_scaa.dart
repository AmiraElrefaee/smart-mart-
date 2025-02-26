import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../const.dart';

class SectionAddOrScaa extends StatelessWidget {
  const SectionAddOrScaa({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(bottom: 25,
        top: 25,
          left: 25,
          right: 25
    ),
    decoration: BoxDecoration(
    color: Colors.white, // Background color
    borderRadius: BorderRadius.circular(15),
    boxShadow: [
    BoxShadow(
    color:ksecodaryColor, // Shadow color with opacity
    spreadRadius: .5, // How much the shadow spreads
    blurRadius: 5, // Blurriness of the shadow
    offset: Offset(0, 4), // Moves shadow down (X: 0, Y: 4)
    ),
    ]
    ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SectionAddMore(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width*.4,
              height:MediaQuery.of(context).size.width*.12 ,
              decoration: BoxDecoration(
                border:Border.all(
                  color:  Color(0xff484C52),
                  width: 1
                ),borderRadius: BorderRadius.circular(10)
                
              ),
              child:Text('Scan items',
              textAlign: TextAlign.center,
              style: TextStyle(

                color: Color(0xff484C52),
                fontWeight: FontWeight.w600,
                fontSize: 18,
                fontFamily: 'Urbanist'
              ),
              ) ,
            ),
              Container(
                margin: EdgeInsets.only(top: 20),
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width*.4,
                height:MediaQuery.of(context).size.width*.12 ,
                decoration: BoxDecoration(
                   color: kColor,
                    borderRadius: BorderRadius.circular(10)

                ),
                child:Text('Add to cart',
                  textAlign: TextAlign.center,
                  style: TextStyle(

                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      fontFamily: 'Urbanist'
                  ),
                ) ,
              ),


          ],),

        ],
      ),
    );}
}

class SectionAddMore extends StatelessWidget {
  const SectionAddMore({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Text('add more of this ?',
      style: TextStyle(
        fontFamily: 'Urbanist',
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
      ),

      Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        width: MediaQuery.of(context).size.width*.27,
        height:MediaQuery.of(context).size.width*.1 ,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(0xffF5F5F5),
          borderRadius: BorderRadius.circular(10)
        ),
        child: CustomAddOrMinusBotton(),
      )

    ],);
  }
}

class CustomAddOrMinusBotton extends StatelessWidget {
  const CustomAddOrMinusBotton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: InkWell(onTap: (){}
              , child: Icon(Icons.minimize,
              color: Color(0xff484C52),
              )),
        ),
        Text('1',
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600
        ),
        ),
        Align(
          alignment: Alignment.center,
          child: InkWell(onTap: (){}
              , child: Icon(Icons.add,
                color: kColor,
              )),
        ),

      ],
    );
  }
}
