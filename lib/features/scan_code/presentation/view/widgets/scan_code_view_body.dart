import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:smart_mart/const.dart';
import 'package:smart_mart/core/utils/styles.dart';
import 'package:smart_mart/features/scan_code/presentation/view/widgets/section_box_message.dart';
import 'package:smart_mart/features/scan_code/presentation/view/widgets/square_camera.dart';

import '../../../../../core/widgets/custom_bottom_bar.dart';
import '../../../../details_item/presentation/views/details_psge_view.dart';
import '../../../../details_item/presentation/views/widgets/details_page_view_body.dart';
import '../details_sacn_product.dart';
import 'conrner_border_painter.dart';
import 'fail_massege.dart';
import 'floating_action_button_camera.dart';
import 'main_massega.dart';

class ScanCodeViewBody extends StatefulWidget {
  const ScanCodeViewBody({super.key});

  @override
  _ScanCodeViewBodyState createState() => _ScanCodeViewBodyState();
}

class _ScanCodeViewBodyState extends State<ScanCodeViewBody> {
  MobileScannerController cameraController = MobileScannerController();
  String? scanResult;
  bool isScanning = true; // متغير للتحكم في حالة المسح

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
    setState(() {
      isScanning = true;
      scanResult = null; // إعادة تعيين scanResult للسماح بمسح جديد
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
              if (!isScanning) return; // إذا كان المسح متوقفًا، لا تفعل شيئًا

              final List<Barcode> barcodes = capture.barcodes;
              if (barcodes.isNotEmpty) {
                final String? result = barcodes.first.rawValue;
                if (result != null && result.isNotEmpty) {
                  setState(() {
                    scanResult = result;
                    isScanning = false; // إيقاف المسح بعد الاكتشاف
                  });

                  // إظهار الرسالة عند اكتشاف QR Code
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent, // إزالة الخلفية البيضاء الزائدة
                    builder: (context) {
                      return DraggableScrollableSheet(
                        // expand: true,
                        initialChildSize: 0.4, // يبدأ من 40% من الشاشة
                        minChildSize: 0.1, // الحد الأدنى للارتفاع
                        maxChildSize: 0.8, // لا يملأ الشاشة بالكامل
                        builder: (context, scrollController) {
                          return ClipRRect(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(20)), // تقليل الزوايا العلوية
                            child: Container(
                              color: Colors.white, // تأكد من لون الخلفية المطلوب
                              child: DetailsSacnProduct(
                                controller: scrollController, // تمرير الكنترولر هنا
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );


                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   SnackBar(
                  //     content: Text('Scan done: $scanResult'),
                  //     duration: Duration(seconds: 2),
                  //   ),
                  // );
                }
              }
            },
          ),
          SectionBoxMassege(screenHeight: screenHeight,
              screenWidth: screenWidth,
              scanResult: scanResult),
          Align(
            alignment: Alignment.bottomCenter,
            child: const CustomBottomBar(),
          ),
          Positioned(
              bottom: screenHeight*.04, // رفعه فوق البار السفلي
              left: MediaQuery.of(context).size.width / 2 - 40, // توسيطه
              child:  FloatingActionButtonCamera(
                onTap:
                    () {
                  startScanning(); // استئناف المسح عند الضغط على الزر
                },
              )
          ),

          SaquareCamera(),
        ],
      ),
    );
  }
}

