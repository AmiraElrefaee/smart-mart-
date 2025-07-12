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
import 'package:smart_mart/features/search/presentation/views/widgets/section_box_massege_qr.dart';
import '../../../../../core/network/socket_service.dart';
import '../../../../login/presentation/managers/login_cubit/login_cubit.dart';
import '../../managers/search_qr_code_cubit/search_qr_code_cubit.dart';


class ScanQrCodeProductViewBody extends StatefulWidget {
  const ScanQrCodeProductViewBody({super.key});

  @override
  _ScanCodeViewBodyState createState() => _ScanCodeViewBodyState();
}

class _ScanCodeViewBodyState extends State<ScanQrCodeProductViewBody> {
  MobileScannerController cameraController = MobileScannerController();
  String? scanResult;
  bool isScanning = true;
  bool scanSubmitted = false;
  bool isCameraRunning = false;

  @override
  void initState() {
    super.initState();
    print("initState: Starting camera");
    // if (!SocketService().isConnected) {
    //   SocketService().connect();
    // }
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

    return BlocListener<SearchQrCodeCubit, SearchQrCodeState>(
      listener: (context, state) {
        if (state is SearchQrCodeSuccess){
          context.go(AppRouter.kdetails,
              extra: state.product
          );
          // GoRouter.of(context).push(AppRouter.kdetails,
          //     extra: state.Items[index]
          // );
          cameraController.stop();
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
                    context.read<SearchQrCodeCubit>().FetchSearchProduct(Qrcode: result);
                    // SocketService().emitScanCart(cartId: result, userId: userId);

                    setState(() {
                      scanSubmitted = true;
                      scanResult = null; // Reset scanResult
                    });

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
          SectionBoxMassegeQr(
            screenHeight: screenHeight,
            screenWidth: screenWidth,
            // scanResult: scanResult, // Commented out as per your code
          ),
          const SaquareCamera(),

        ],
      ),
    );
  }

}