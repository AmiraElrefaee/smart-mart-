import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:smart_mart/features/scan_code/presentation/view/widgets/scan_code_view_body.dart';
import 'package:smart_mart/features/scan_code/presentation/view/widgets/section-title_app_bar.dart';
import 'package:smart_mart/features/scan_code/presentation/view/widgets/section_show_scanned_item.dart';

import '../../../../../const.dart';

class SectionDraggleTotalNum extends StatefulWidget {
  @override
  _DraggableWidgetState createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends State<SectionDraggleTotalNum> {
  double _position = 0.0;


  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return

      // Positioned(
      // bottom: _position,
      // child: GestureDetector(
      //   onVerticalDragUpdate: (details) {
      //     setState(() {
      //       _position -= details.delta.dy;
      //
      //       // تحديد الحد الأدنى للسحب (لا ينزل أقل من MediaQuery.of(context).size.height * 0.1)
      //       if (_position < MediaQuery.of(context).size.height * 0.007) {
      //         _position = MediaQuery.of(context).size.height * 0.007;
      //       }
      //
      //       // تحديد الحد الأقصى للسحب (لا يتحرك لأعلى أكثر من ارتفاع الـ Widget)
      //       if (_position > screenHeight * 0.1) {
      //         _position = screenHeight * 0.1;
      //         showModalBottomSheet(
      //           context: context,
      //           builder: (BuildContext context) {
      //             return SectionShowScannedItem();
      //           },
      //         );
      //
      //       }
      //     });
      //   },
      //   child:

        Container(
          height: screenHeight * 0.2,
          width: screenWidth,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // CustomLine(), // إخفاء الخط عند السحب
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: kColor,
                      child: const Text(
                        '1',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const Text(
                      '  View Cart',
                      style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                      width: 1,
                      height: screenHeight * 0.04,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xffDADADA),
                      ),
                    ),
                    const Text(
                      'EGP 64.95',
                      style: TextStyle(
                        fontSize: 20,
                        color: kColor,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Urbanist',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ));
    //     ),
    //   ),
    // );
  }
}
