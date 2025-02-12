import 'package:flutter/cupertino.dart';
import 'package:smart_mart/features/home/presentation/views/widgets/section_discount.dart';

import '../../../../on_boarding/presentation/views/widgets/section_trigger_points.dart';
import 'custom_app_bar.dart';
import 'custom_search_bar.dart';

class SectionUpToOffers extends StatefulWidget {
  const SectionUpToOffers({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  State<SectionUpToOffers> createState() => _SectionUpToOffersState();
}

class _SectionUpToOffersState extends State<SectionUpToOffers> {
  int currentIndex=0;
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.screenWidth * .05),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 34),
          child: CustomAppBar(screenWidth: widget.screenWidth),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 11),
          child: CustomSearchBar(screenWidth: widget.screenWidth),
        ),
        SizedBox(
          height: 200, // ارتفاع ثابت لـ ListView
          child: PageView.builder(
            // controller: _pageController,
            itemCount: 3,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index; // تحديث currentIndex عند تغيير الصفحة
              });
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(5),
                child: SizedBox(
                  width: widget.screenWidth * 0.86, // عرض كل عنصر في ListView
                  child: SectionDisconut(screenWidth: widget.screenWidth),
                ),
              );
            },
          ),
        ),
        SectionTriggerPoints(currentIndex: currentIndex),
      ],),
    );
  }
}

