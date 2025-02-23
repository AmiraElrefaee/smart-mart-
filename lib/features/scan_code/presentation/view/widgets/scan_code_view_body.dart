import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:smart_mart/const.dart';
import 'package:smart_mart/core/utils/styles.dart';

import 'conrner_border_painter.dart';
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

  void _showSuccessDialog(String result) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("نجاح"),
          content: Text("تم مسح QR Code بنجاح: $result"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // إغلاق الصندوق
              },
              child: Text("موافق"),
            ),
          ],
        );
      },
    );
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
          Positioned(
            
            bottom: screenHeight*.25,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 30),
              width: screenWidth*.85,
              height: screenHeight*.2,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)

              ),

              child:scanResult==null||scanResult=='No data found'?
              FailMassege(screenWidth: screenWidth):
              MainMassege(screenWidth: screenWidth),
            ),
          ),


          aquareCamera(),
        ],
      ),
    );
  }
}

class MainMassege extends StatelessWidget {
  const MainMassege({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(child: SvgPicture.asset('assets/icons/Vector (12).svg',
        width: screenWidth*.13,
        )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text('Scan the',
          style: TextStyle(
            fontFamily: 'Urbanis',
            fontSize: screenWidth*.05,
            fontWeight: FontWeight.w600,
            color: Color(0xff263238),
          ),
          ),Text(' barcode',
              style: TextStyle(
                fontFamily: 'Urbanis',
                fontSize: screenWidth*.05,
                fontWeight: FontWeight.w600,
                color: kColor,
              ),
            ),

        ],),

                Text('to add the product to your cart.',
    style: TextStyle(
      fontFamily: 'Urbanis',
      fontSize: screenWidth*.05,
      fontWeight: FontWeight.w600,
      color: Color(0xff263238),
    )),
      ],
    );
  }
}
class FailMassege extends StatelessWidget {
  const FailMassege({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(child: Icon(Icons.error_outline,
        color: kColor,
          size: screenWidth*.1,
        ),),


        Text('This item currently unavaliable',
            style: TextStyle(
              fontFamily: 'Urbanis',
              fontSize: screenWidth*.05,
              fontWeight: FontWeight.w600,
              color: Color(0xff263238),
            )),
      ],
    );
  }
}

class aquareCamera extends StatelessWidget {
  const aquareCamera({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: MediaQuery.of(context).size.height*.5,
      child: Container(
        width: 220,
        height: 220,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white.withOpacity(.44),
        ),
        child: CustomPaint(
          painter: CornerBorderPainter(cornerRadius: 30.0), // Set your desired radius
        ),
      ),
    );
  }
}