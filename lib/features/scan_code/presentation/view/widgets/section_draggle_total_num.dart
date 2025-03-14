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
class MyDraggableSheet extends StatefulWidget {
  const MyDraggableSheet({super.key, required this.cameraController});
  final MobileScannerController cameraController;
  @override
  State<MyDraggableSheet> createState() => _MyDraggableSheetState();
}

class _MyDraggableSheetState extends State<MyDraggableSheet> {
  final DraggableScrollableController _controller = DraggableScrollableController();
  final double _maxChildSize = 0.3;


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification is ScrollEndNotification) {
              if (_controller.size >= _maxChildSize * 0.8) {
                _openBottomSheet(context);
              }
            }
            return true;
          },
          child: DraggableScrollableSheet(
            controller: _controller,
            initialChildSize: 0.18,
            minChildSize: 0.18,
            maxChildSize: _maxChildSize,
            snap: true,
            snapSizes: const [0.18, 0.3],
            builder: (context, scrollController) {
              return DecoratedBox(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(22),
                    topRight: Radius.circular(22),
                  ),
                ),
                child: CustomScrollView(
                  controller: scrollController,
                  slivers: [
                    SliverToBoxAdapter(
                      child: Center(
                        child: CustomLine(),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SectionDraggleTotalNum(),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  void _openBottomSheet(BuildContext context) {
    showModalBottomSheet(
      useRootNavigator: true,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SectionShowScannedItem(
          cameraController: widget.cameraController,
        );
      },
    );
  }
}