
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_mart/features/splash/presentation/views/widgets/sliding_text.dart';
import 'package:smart_mart/utils/functions/app_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _controller2;

  late List<Animation<Offset>> _slideAnimations;
  late List<Animation<double>> _fadeAnimations;
  late Animation<double> _fadeAnimations2;
  late Animation<Offset> _animation;
  late Animation<Offset> _animation2;
  @override
  void initState() {
    super.initState();

    // Initialize the controller
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    _controller2 = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _animation = Tween<Offset>(
      begin: Offset(-0.06, 0), // يبدأ من أسفل الشاشة
      end: Offset(0.0, 0.0),   // ينتهي في منتصف الشاشة
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    _animation2 = Tween<Offset>(
      begin: Offset(-0.09, 0), // يبدأ من أسفل الشاشة
      end: Offset(0.0, 0.0),   // ينتهي في منتصف الشاشة
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    // Initialize animations for sliding and fading
    _slideAnimations = [
      Tween<Offset>(
        begin: Offset(0.0, 1.0), // Start below the screen
        end: Offset(0.0, 0.0),   // End at the center
      ).animate(CurvedAnimation(
        parent: _controller2,
        curve: Interval(0.0, 0.4, curve: Curves.easeInOut),
      )),
      Tween<Offset>(
        begin: Offset(0.0, 1.0), // Start below the screen
        end: Offset(0.0, 0.0),     // End at its position
      ).animate(CurvedAnimation(
        parent: _controller2,
        curve: Interval(0.4, 0.7, curve: Curves.easeInOut),
      )),
      Tween<Offset>(
        begin: Offset(0.0, 1.0), // Start below the screen
        end: Offset(0.0, 0.0),     // End at its position
      ).animate(CurvedAnimation(
        parent: _controller2,
        curve: Interval(0.7, 1.0, curve: Curves.easeInOut),
      )),
    ];
    _fadeAnimations2 =
    Tween<double>(begin: 0.0, end: 1.0).animate(_controller,);

    _fadeAnimations = [
      Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _controller2,
        curve: Interval(0.0, 0.4, curve: Curves.easeInOut),
      )),
      Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _controller2,
        curve: Interval(0.4, 0.7, curve: Curves.easeInOut),
      )),
      Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _controller2,
        curve: Interval(0.7, 1.0, curve: Curves.easeInOut),
      )),
    ];

    _controller.forward();
    _controller2.forward();
    NaviagateToHome();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [


              FadeTransition(
                opacity: _fadeAnimations2,
                child: SlideTransition(
                  position: _animation,
                  child: AspectRatio(
                      aspectRatio: 14/4,
                      child: SvgPicture.asset('assets/images/Group 2.svg')),
                ),
              ),
              SizedBox(height: 15,),
              FadeTransition(
                opacity: _fadeAnimations2,
                child: SlideTransition(
                  position: _animation2,
                  child: AspectRatio(
                    aspectRatio: 30/4,
                      child: SvgPicture.asset('assets/images/Group 1.svg')),
                ),
              ),
        const SizedBox(
          height: 20,
        ),
        SlidingText(slideAnimations: _slideAnimations,fadeAnimations: _fadeAnimations,),
      ],
    );
  }

void NaviagateToHome(){
    Future.delayed(const Duration(seconds: 2),(){
      GoRouter.of(context).push(AppRouter.konBoarding);

    });
}
}
