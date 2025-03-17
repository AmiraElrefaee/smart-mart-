import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_mart/const.dart';
import 'package:video_player/video_player.dart';

import '../../../../../core/widgets/custom_botton.dart';

class  CopletePageViewBody extends StatefulWidget {
  const  CopletePageViewBody({super.key});

  @override
  State<CopletePageViewBody> createState() => _CopletePageViewBodyState();
}

class _CopletePageViewBodyState extends State<CopletePageViewBody> {
  late VideoPlayerController _controller;
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      'assets/video/e232cd7e5def8bce8ab885c43be920b7b293bbe0.mp4',
    )..initialize().then((_) {
      print("Video initialized successfully!");
      // تشغيل الفيديو تلقائيًا بعد التهيئة
      _controller.setLooping(true); // إعادة التشغيل التلقائي (Loop)
      _controller.play(); // بدء التشغيل
      // setState(() {});
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
          child: _controller.value.isInitialized
              ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
              : CircularProgressIndicator(),
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
        Padding(
          padding:  EdgeInsets.all(MediaQuery.of(context).size.width*.08),
          child: CustomBotton(
            background: kColor,
            colorText: Colors.white,
              text: 'Done',
            screenWidth: MediaQuery.of(context).size.width,
            screenHeight: MediaQuery.of(context).size.height,
            onTap: (){},
          ),
        ),

        Spacer(flex: 1,)
      ],
    );
  }
}
