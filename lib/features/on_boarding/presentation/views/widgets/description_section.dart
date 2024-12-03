import 'package:flutter/cupertino.dart';
import 'package:smart_mart/features/on_boarding/data/models/content_model.dart';

import '../../../../../core/utils/styles.dart';


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
              child: Text(contents[index].discription,
                  style: Styles.Urbanist16.copyWith(
                    fontSize: MediaQuery.of(context).size.width*.037
                  ),

              textAlign: TextAlign.center,),
            )),
      ],
    );
  }
}
