import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../const.dart';

class CustomAddOrMinusBotton extends StatefulWidget {
  const CustomAddOrMinusBotton({
    super.key,
  });

  @override
  State<CustomAddOrMinusBotton> createState() => _CustomAddOrMinusBottonState();
}

class _CustomAddOrMinusBottonState extends State<CustomAddOrMinusBotton> {
  int num=1;
  @override
  Widget build(BuildContext context) {
    return
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          width: MediaQuery.of(context).size.width*.24,
          height:MediaQuery.of(context).size.width*.1 ,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Color(0xffF5F5F5),
              borderRadius: BorderRadius.circular(10)
          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: InkWell(onTap: (){
              if(num>0) setState(() {
                num--;
              });

            }
                , child: Icon(Icons.minimize,
                  color: Color(0xff484C52),
                )),
          ),
          Text('$num',
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: InkWell(
                onTap: (){
                  setState(() {
                    num++;
                  });

                }
                , child: Icon(Icons.add,
                  color: kColor,
                )),
          ),

        ],
      ),
    );
  }
}
