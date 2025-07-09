import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../scan_code/presentation/view/widgets/fail_massege.dart';
import '../../../../scan_code/presentation/view/widgets/main_massega.dart';
import '../../managers/search_qr_code_cubit/search_qr_code_cubit.dart';



class SectionBoxMassegeQr extends StatelessWidget {
  const SectionBoxMassegeQr({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    // required this.scanResult,
    // required this.sucess,
  });

  final double screenHeight;
  final double screenWidth;
  // final String? scanResult;
  // final bool sucess;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: screenHeight * .25,
      child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 30),
          width: screenWidth * .85,
          height: screenHeight * .2,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child:

          BlocBuilder<SearchQrCodeCubit, SearchQrCodeState>(
            builder: (context, state) {
              if (state is SearchQrCodeFail){
                return FailMassege(screenWidth: screenWidth,);
              }
              else return MainMassege(screenWidth: screenWidth);
            },
          )
      ),
    );
  }
}
//xisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Center(child: Icon(Icons.error_outline,
//           color: kColor,
//           size: screenWidth*.1,
//         ),),
//
//
//         Text('This item currently unavaliable',
//             style: TextStyle(
//               fontFamily: 'Urbanis',
//               fontSize: screenWidth*.05,
//               fontWeight: FontWeight.w600,
//               color: Color(0xff263238),
//             )),
//       ],
//     );