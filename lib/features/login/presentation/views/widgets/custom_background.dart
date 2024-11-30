import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_mart/features/on_boarding/data/models/content_model.dart';

class CustomBackground extends StatelessWidget {
  const CustomBackground({super.key});


  @override

  @override
  Widget build(BuildContext context) {
    return Stack(children: [

      Positioned(
          height: MediaQuery.of(context).size.height*.45,
          width: MediaQuery.of(context).size.width,

          child:  SizedBox.expand( // Ensures consistent size for the transition
            child: Image.asset(
              'assets/images/Group 4.png',

              fit: BoxFit.fill,
            ),
          )

      ),
      Positioned(
        top: MediaQuery.of(context).size.height*.22, // تقطع الجزء العلوي من الصورة الأولى
        left: 0,
        right: 0,
        bottom: 0,
        child: SvgPicture.asset('assets/images/Rectangle 52.svg',
          fit: BoxFit.fill,
        ),
      ),
      Positioned(
        top: MediaQuery.of(context).size.height*.247, // تقطع الجزء العلوي من الصورة الأولى
        left: 0,
        right: 0,
        bottom: 0,
        child: SvgPicture.asset('assets/images/Rectangle 6.svg',
          fit: BoxFit.fill,
        ),
      ),

    ],);
  }
}
