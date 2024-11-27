import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_mart/features/on_boarding/data/models/content_model.dart';

class CustomBackgroundImages extends StatefulWidget {
  const CustomBackgroundImages({super.key, required this.index});
final int index;

  @override
  State<CustomBackgroundImages> createState() => _CustomBackgroundImagesState();
}

class _CustomBackgroundImagesState extends State<CustomBackgroundImages>
    with  SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<Offset> _animation;
  late Animation<Offset> _animation2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    setupAnimations();
    _controller.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(children: [

      Positioned(
        height: MediaQuery.of(context).size.height*.53,
        width: MediaQuery.of(context).size.width,

        child:  AnimatedSwitcher(
          duration: const Duration(milliseconds: 1000),
          switchInCurve: Curves.easeInOut,
          switchOutCurve: Curves.easeInOut,
          child: SlideTransition(
            key: ValueKey<int>(widget.index),
            position: _animation2,
            child: SizedBox.expand( // Ensures consistent size for the transition
              child: Image.asset(
                contents[widget.index].image,

                fit: BoxFit.cover,
              ),
            ),
          ),
        )

      ),
      SlideTransition(
        position: _animation ,
        child: Stack(children: [
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
        ],),
      ),

    ],);
  }
  void setupAnimations() {
    if (widget.index == 0) {
      _animation = Tween<Offset>(
        begin: const Offset(0.0, .2), // يبدأ من أسفل الشاشة
        end: const Offset(0.0, 0.0),   // ينتهي في منتصف الشاشة
      ).animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ));
    } else {
      _animation = Tween<Offset>(
        begin: const Offset(0.0, 0.0), // يبدأ في موضعه الطبيعي
        end: const Offset(0.0, 0.0),   // يظل ثابتًا
      ).animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ));
    }
    _animation2 = Tween<Offset>(
      begin: Offset(0.015, -.01), // يبدأ من أسفل الشاشة
      end: Offset(0.0, 0.0),   // ينتهي في منتصف الشاشة
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }
}
