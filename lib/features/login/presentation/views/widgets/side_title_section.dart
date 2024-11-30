import 'package:flutter/cupertino.dart';

import '../../../../../utils/styles.dart';

class SideTitleSection extends StatelessWidget {
  const SideTitleSection({
    super.key, required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left:MediaQuery.of(context).size.width*.06 ,
          bottom: MediaQuery.of(context).size.width*.01
      ),
      child: Text(text,style: Styles.Urbanist15.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: MediaQuery.of(context).size.width*.04
      )
      ),
    );
  }
}
