import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:smart_mart/core/utils/styles.dart';

class ScanCodeViewBody extends StatefulWidget {
  const ScanCodeViewBody({super.key});

  @override
  _ScanCodeViewBodyState createState() => _ScanCodeViewBodyState();
}

class _ScanCodeViewBodyState extends State<ScanCodeViewBody> {
  MobileScannerController cameraController = MobileScannerController();
  String scanResult = '';
  bool isScanning = false; // متغير للتحكم في المسح

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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined), // تغيير الأيقونة
          onPressed: () {
            Navigator.pop(context); // الرجوع للخلف عند الضغط
          },
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text('QR Code Scanner',
        style: TextStyle(
          fontFamily: 'Urbanis',
          fontWeight: FontWeight.w600,
          fontSize: 22
        )
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
                  cameraController.stop(); // إيقاف الكاميرا بعد المسح
                });
              }
            },
          ),

          Positioned(
            bottom: 120,
            child: ElevatedButton(
              onPressed: isScanning ? null : startScanning, // تعطيل الزر أثناء المسح
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text('Scan QR Code'),
            ),
          ),

          // Positioned(
          //   bottom: 60,
          //   child: Text(
          //     'Scan Result: $scanResult',
          //     style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          //   ),
          // ),

          Center(
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 3),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),

          // تظليل خارج المربع لجذب التركيز عليه

        ],
      ),
    );
  }
}
