import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_mart/features/on_boarding/data/models/content_model.dart';

class CustomBackgroundImages extends StatelessWidget {
  const CustomBackgroundImages({super.key, required this.index});
final int index;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [

      Positioned(
        height: MediaQuery.of(context).size.height*.53,
        width: MediaQuery.of(context).size.width,

        child:  AnimatedSwitcher(
          duration: const Duration(milliseconds: 1000),
          child: SizedBox.expand( // Ensures consistent size for the transition
            child: Image.asset(
              contents[index].image,
              key: ValueKey<int>(index),
              fit: BoxFit.cover,
            ),
          ),
        )

      ),
      Positioned(
        top: MediaQuery.of(context).size.height*.389, // تقطع الجزء العلوي من الصورة الأولى
        left: 0,
        right: 0,
        bottom: 0,
        child: SvgPicture.asset('assets/images/Rectangle 5.svg',
          fit: BoxFit.cover,
        ),
      ),
      Positioned(
        top: MediaQuery.of(context).size.height*.428, // تقطع الجزء العلوي من الصورة الأولى
        left: 0,
        right: 0,
        bottom: 0,
        child: SvgPicture.asset('assets/images/Rectangle 3.svg',
          fit: BoxFit.cover,
        ),
      ),
    ],);
  }
}
