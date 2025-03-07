import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../const.dart';

class bottonsScannedItem extends StatelessWidget {
  const bottonsScannedItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0,
        right: 0,
        left: 0,
        child: Container(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(
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
                  ),
                  InkWell(

                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width*.4,
                      height:MediaQuery.of(context).size.width*.12 ,
                      decoration: BoxDecoration(
                          color: kColor,
                          borderRadius: BorderRadius.circular(10)

                      ),
                      child:Text('Checkout',
                        textAlign: TextAlign.center,
                        style: TextStyle(

                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            fontFamily: 'Urbanist'
                        ),
                      ) ,
                    ),
                  ),


                ],),

            ],
          ),
        )

    );
  }
}
