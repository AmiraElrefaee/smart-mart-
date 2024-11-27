import 'package:flutter/cupertino.dart';
import 'package:smart_mart/features/on_boarding/data/models/content_model.dart';

import '../../../../../utils/styles.dart';

class TitleSection extends StatefulWidget {
  const TitleSection({super.key, required this.index});
final int index;

  @override
  State<TitleSection> createState() => _TitleSectionState();
}

class _TitleSectionState extends State<TitleSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimations2;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _fadeAnimations2 =
        Tween<double>(begin: 0.2, end: 1.0).animate(_controller,);
    _controller.forward();

  }
  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Positioned(
          key: ValueKey<int>(widget.index), // This ensures the widget rebuilds and triggers animation
          width: MediaQuery.of(context).size.width,
          top: MediaQuery.of(context).size.height * .57,
          child: FadeTransition(
            // padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .107),

          opacity: _fadeAnimations2,
            child: Text(
              contents[widget.index].title, // Assuming `contents[index].title` is the title
              style: Styles.NexaBold30,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
