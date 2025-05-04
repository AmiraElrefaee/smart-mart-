import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../managers/socket_error_cubit/socket_error_cubit.dart';
import 'fail_massege.dart';
import 'main_massega.dart';

class SectionBoxMassege extends StatelessWidget {
  const SectionBoxMassege({
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

          BlocBuilder<SocketErrorCubit, SocketErrorState>(
            builder: (context, state) {
              if (state is SocketErrorScanCart){
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