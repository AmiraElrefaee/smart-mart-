import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:smart_mart/core/utils/functions/Navigate_to_page.dart';
import 'package:smart_mart/core/utils/functions/app_router.dart';
import 'package:smart_mart/features/scan_code/presentation/view/widgets/scetion_my_darggle_sheet.dart';
import 'package:smart_mart/features/scan_code/presentation/view/widgets/section-title_app_bar.dart';
import 'package:smart_mart/features/scan_code/presentation/view/widgets/section_box_message.dart';
import 'package:smart_mart/features/scan_code/presentation/view/widgets/section_draggle_total_num.dart';
import 'package:smart_mart/features/scan_code/presentation/view/widgets/square_camera.dart';
import '../../../../../core/network/socket_service.dart';
import '../../../../login/presentation/managers/login_cubit/login_cubit.dart';
import '../../managers/     scanned_product_socket/scanned_product_socket_cubit.dart';
import '../../managers/cubit_scanned_item/scanned_item_cubit.dart';
import '../../managers/socket_error_cubit/socket_error_cubit.dart';
import '../details_sacn_product.dart';
import 'fail_massege.dart';
import 'main_massega.dart';

class ScanCodeViewBody extends StatefulWidget {
  const ScanCodeViewBody({super.key});

  @override
  _ScanCodeViewBodyState createState() => _ScanCodeViewBodyState();
}

class _ScanCodeViewBodyState extends State<ScanCodeViewBody> {
  MobileScannerController cameraController = MobileScannerController();
  String? scanResult;
  bool isScanning = true;
  bool scanSubmitted = false;
  bool isCameraRunning = false;

  @override
  void initState() {
    super.initState();
    print("initState: Starting camera");
    if (!SocketService().isConnected) {
      SocketService().connect();
    }
    if (!isCameraRunning) {
      cameraController.start().then((_) {
        setState(() {
          isCameraRunning = true;
        });
      }).catchError((error) {
        print("Error starting camera: $error");
      });
    }
    startScanning();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ModalRoute.of(context)?.addScopedWillPopCallback(() async {
      print("addScopedWillPopCallback: Restarting camera");
      if (!isCameraRunning) {
        await cameraController.start();
        setState(() {
          isCameraRunning = true;
          isScanning = true;
          scanResult = null;
        });
      }
      return true;
    });
  }

  @override
  void dispose() {
    print("dispose: Stopping camera");
    if (isCameraRunning) {
      cameraController.stop();
      setState(() {
        isCameraRunning = false;
      });
    }
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

    return BlocListener<ScannedProductSocketCubit, ScannedProductSocketState>(
  listener: (context, state) {
  if (state is ScannedCartSucess){
    print(' the connet tooooo basket sucesssss');
    context.go(AppRouter.ksucessConnectToCart);
    context.read<ScannedProductSocketCubit>();
  }
  },
  child: Stack(
      alignment: Alignment.center,
      children: [
        MobileScanner(
          controller: cameraController,
          onDetect: (capture) async {
            if (!isScanning) return;

            final List<Barcode> barcodes = capture.barcodes;
            if (barcodes.isNotEmpty) {
              final String? result = barcodes.first.rawValue;
              if (result != null && result.isNotEmpty) {
                setState(() {
                  scanResult = result;
                  isScanning = false;
                });

                final loginCubit = context.read<LoginCubit>();
                final String? userId = loginCubit.decodedToken?['_id'];

                if (userId != null) {
                  SocketService().emitScanCart(cartId: result, userId: userId);

                  setState(() {
                    scanSubmitted = true;
                    scanResult = null; // Reset scanResult
                  });

                  await cameraController.stop();
                  setState(() {
                    isCameraRunning = false;
                  });
                  // context.go(AppRouter.ksucessConnectToCart);
                  // context.push(AppRouter.ksucessConnectToCart);
                  // navigateToPage(AppRouter.ksucessConnectToCart, context);
                } else {
                  print("⚠️ User ID not found. Make sure login is successful.");
                }
              }
            }
          },
        ),
        SectionBoxMassege(
          screenHeight: screenHeight,
          screenWidth: screenWidth,
          // scanResult: scanResult, // Commented out as per your code
        ),
        const SaquareCamera(),
        // MyDraggableSheet(
        //   cameraController: cameraController,
        // ),
      ],
    ),
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