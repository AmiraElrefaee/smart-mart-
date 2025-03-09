import 'package:flutter/cupertino.dart';

class TopNeddAnyThingSheet extends StatelessWidget {
  const TopNeddAnyThingSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        Text('Need anything else? ',
          style: TextStyle(
              fontFamily: 'Urbanist',
              color: Color(0xff484C52),
              fontSize: 20,
              fontWeight: FontWeight.w600
          ),
        )
        , Text('check out these items we think you’ll love it',
          style: TextStyle(
              fontFamily: 'Urbanist',
              color: Color(0xff989797),
              fontSize: 15,
              fontWeight: FontWeight.w600
          ),
        )
      ],);
  }
}





