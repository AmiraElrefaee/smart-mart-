import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../const.dart';

class CustomVrialItem extends StatelessWidget {
  const CustomVrialItem({
    super.key, required this.Item,

  });

  final List Item;

  @override
  Widget build(BuildContext context) {

    return Wrap(
        spacing: 10.0, // المسافة الأفقية بين العناصر
        runSpacing: 10,
        children: List.generate(Item.length, (index){
          return  InkWell(
            onTap: (){},
            child: Container(

              padding: EdgeInsets.symmetric(vertical: 10,
                  horizontal: 14
              ),

              decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    width: 1,
                    color: kcolor4,
                  )
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(

                    Item[index]['icons'],
                    color: kcolor4,
                    size: 15,

                  ),

                  SizedBox(width: 10,),
                  Text(Item[index]['title'],
                    style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: kcolor4
                    ),
                  )
                ],
              ),
            ),
          );}
        )
    );
  }
}

