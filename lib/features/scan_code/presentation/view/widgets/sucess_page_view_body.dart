import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_mart/core/utils/functions/Navigate_to_page.dart';
import 'package:smart_mart/core/utils/functions/app_router.dart';
import 'package:video_player/video_player.dart';

import '../../../../../const.dart';
import '../../managers/     scanned_product_socket/scanned_product_socket_cubit.dart';

class SucessPageViewBody extends StatefulWidget {
  const SucessPageViewBody({super.key});

  @override
  State<SucessPageViewBody> createState() => _SucessPageViewBodyState();
}

class _SucessPageViewBodyState extends State<SucessPageViewBody> {
  late VideoPlayerController _controller;
  // void initState() {
  //   super.initState();
  //   // تأكدي من أن الكيوبت مُهيأ بشكل صحيح
  //   context.read<ScannedProductSocketCubit>();
  // }
  @override
  void initState() {
    super.initState();
    // context.read<ScannedProductSocketCubit>();
    _controller = VideoPlayerController.asset(
      'assets/video/e232cd7e5def8bce8ab885c43be920b7b293bbe0.mp4',
    )..initialize().then((_) {
      print("Video initialized successfully!");
      _controller.setLooping(true);
      _controller.play();

      // ✨ الانتقال بعد ثانيتين
      Future.delayed(Duration(seconds: 2), () {
        context.go(AppRouter.kAddToCart);
        // navigateToPage(AppRouter.kAddToCart, context);
      });
    }).catchError((error) {
      print("Error initializing video: $error");
    });
  }
  @override
  void dispose() {
    super.dispose();
    _controller.dispose(); // تحرير الموارد عند إغلاق الصفحة
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Spacer(flex: 3,),
        Container(
          margin: EdgeInsets.only(bottom: 50),
          height:MediaQuery.of(context).size.width*.3 ,
          alignment: Alignment.center,
          child:
               AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
              // : CircularProgressIndicator(),
        ),

        Text('Payment Successful !',
          style: TextStyle(
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.w700,
              fontSize: 25
          ),
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const  Text('Your order',
              style: TextStyle(
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Color(0xff484C52)
              ),
            ),
            Text(' #12345 ',
              style: TextStyle(
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: kColor
              ),
            ),
            Text('is confirmed.',
              style: TextStyle(
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Color(0xff484C52)
              ),
            ),

          ],),

        Text(' Check your email for details.',
          style: TextStyle(
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: Color(0xff484C52)
          ),
        ),
        Spacer(flex: 2,),
        // Padding(
        //   padding:  EdgeInsets.all(MediaQuery.of(context).size.width*.08),
        //   child: CustomBotton(
        //     background: kColor,
        //     colorText: Colors.white,
        //     text: 'Done',
        //     screenWidth: MediaQuery.of(context).size.width,
        //     screenHeight: MediaQuery.of(context).size.height,
        //     onTap: (){},
        //   ),
        // ),

        Spacer(flex: 1,)
      ],
    );
  }
}
