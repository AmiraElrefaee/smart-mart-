import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:smart_mart/const.dart';
import 'package:smart_mart/core/utils/styles.dart';
import 'package:smart_mart/features/scan_code/presentation/view/widgets/section_box_message.dart';
import 'package:smart_mart/features/scan_code/presentation/view/widgets/square_camera.dart';

import 'conrner_border_painter.dart';
import 'fail_massege.dart';
import 'main_massega.dart';
// تأكد من أن اسم الملف صحيح

class ScanCodeViewBody extends StatefulWidget {
  const ScanCodeViewBody({super.key});

  @override
  _ScanCodeViewBodyState createState() => _ScanCodeViewBodyState();
}

class _ScanCodeViewBodyState extends State<ScanCodeViewBody> {

  MobileScannerController cameraController = MobileScannerController();
  String ?scanResult;
  bool isScanning = false; // متغير للتحكم في المسح

  @override
  void initState() {
    super.initState();
    startScanning(); // بدء المسح تلقائيًا عند فتح الشاشة
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  void startScanning() {
    if (isScanning) return; // منع الضغط المتكرر
    setState(() {
      isScanning = true;
      scanResult = "Scanning...";
    });

    // تفعيل الكاميرا ثم بدء المسح بعد قليل
    cameraController.start();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        leading: IconButton(
          icon: Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Icon(Icons.arrow_back_ios_new_outlined),
          ), // تغيير الأيقونة
          onPressed: () {
            Navigator.pop(context); // الرجوع للخلف عند الضغط
          },
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 25),
          child: const Text('QR Code Scanner',
              style: TextStyle(
                  fontFamily: 'Urbanis',
                  fontWeight: FontWeight.w600,
                  fontSize: 22
              )
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          MobileScanner(
            controller: cameraController,
            onDetect: (capture) {
              final List<Barcode> barcodes = capture.barcodes;
              if (barcodes.isNotEmpty) {
                setState(() {
                  scanResult = barcodes.first.rawValue ?? 'No data found';
                  isScanning = false;
                });

                // إظهار صندوق الحوار عند اكتشاف QR Code
                // _showSuccessDialog(scanResult);
              }
            },
          ),
          SectionBoxMassege(screenHeight: screenHeight, screenWidth: screenWidth, scanResult: scanResult),


          SaquareCamera(),
        ],
      ),
    );
  }
}

