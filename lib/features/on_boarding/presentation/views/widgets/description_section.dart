import 'package:flutter/cupertino.dart';
import 'package:smart_mart/features/on_boarding/data/models/content_model.dart';

import '../../../../../utils/styles.dart';

class DescriptionSection extends StatelessWidget {
  const DescriptionSection({super.key, required this.index});
final int index ;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            width: MediaQuery.of(context).size.width,
            top: MediaQuery.of(context).size.height * .69,
            child:  Padding(
              padding: EdgeInsets.symmetric( horizontal:MediaQuery.of(context).size.width*.1),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 1000),
                switchInCurve: Curves.easeInOut,
                switchOutCurve: Curves.easeInOut,
                child: Text(contents[index].discription,
                    style: Styles.Urbanist16,

                textAlign: TextAlign.center,),
              ),
            )),
      ],
    );
  }
}
