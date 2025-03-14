import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../const.dart';

class TopOfMyCart extends StatelessWidget {
  const TopOfMyCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('My cart',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              fontFamily: 'Urbanist'
          ),
        ),

        TextButton(onPressed: (){},
            child: Text('view all',
              style: TextStyle(
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: kColor
              ),
            ))

      ],
    );
  }
}