import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:smart_mart/features/scan_code/presentation/view/widgets/section-title_app_bar.dart';
import 'package:smart_mart/features/scan_code/presentation/view/widgets/section_box_message.dart';
import 'package:smart_mart/features/scan_code/presentation/view/widgets/section_draggle_total_num.dart';
import 'package:smart_mart/features/scan_code/presentation/view/widgets/square_camera.dart';

import '../details_sacn_product.dart';

class ScanCodeViewBody extends StatefulWidget {
  const ScanCodeViewBody({super.key});

  @override
  _ScanCodeViewBodyState createState() => _ScanCodeViewBodyState();
}

class _ScanCodeViewBodyState extends State<ScanCodeViewBody> {
  MobileScannerController cameraController = MobileScannerController();
  String? scanResult;
  bool isScanning = true;

  @override
  void initState() {
    super.initState();
    startScanning();
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  void startScanning() {
    setState(() {
      isScanning = true;
      scanResult = null;
    });
  }

  void stopScanning() {
    setState(() {
      isScanning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Stack(
        alignment: Alignment.center,
        children: [
          MobileScanner(
            controller: cameraController,
            onDetect: (capture) {
              if (!isScanning) return;

              final List<Barcode> barcodes = capture.barcodes;
              if (barcodes.isNotEmpty) {
                final String? result = barcodes.first.rawValue;
                if (result != null && result.isNotEmpty) {
                  setState(() {
                    scanResult = result;
                    isScanning = false;
                  });

                  buildShowModalBottomSheet(context).then((_) {
                    startScanning(); // إعادة تشغيل المسح عند إغلاق الـ BottomSheet
                  });
                }
              }
            },
          ),

          SectionBoxMassege(
            screenHeight: screenHeight,
            screenWidth: screenWidth,
            scanResult: scanResult,
          ),

          const SaquareCamera(),
          // MyDraggableSheet(),

          // إضافة SectionDraggleTotalNum هنا
          
          MyDraggableSheet(
            cameraController: cameraController,
          ),

        ],

    );
  }

  Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      useRootNavigator: true,
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.4,
          minChildSize: 0.1,
          maxChildSize: 0.8,
          builder: (context, scrollController) {
            return ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Container(
                color: Colors.white,
                child: DetailsSacnProduct(
                  controller: scrollController,
                ),
              ),
            );
          },
        );
      },
    );
  }
}