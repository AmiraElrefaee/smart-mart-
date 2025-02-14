import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../const.dart';
import '../../../../../core/utils/styles.dart';
import '../../../data/models/categories_item.dart';
import 'custom_side_title.dart';

class SectionGridCategory extends StatefulWidget {
  const SectionGridCategory({
    super.key,
    required this.screenWidth,

  });

  final double screenWidth;

  @override
  State<SectionGridCategory> createState() => _SectionGridCategoryState();
}

class _SectionGridCategoryState extends State<SectionGridCategory> {

  bool viewall=false;
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.only(right:  widget.screenWidth * .08, ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomSideTitle(
                screenWidth: widget.screenWidth,
                text: ' Categories',
                icon: 'assets/icons/Group 6.svg',
              ),
              InkWell(
                onTap: (){
                  setState(() {
                    viewall=!viewall;
                  });
                },
                child: Text('view all',
                  style: Styles.NexaLight16.copyWith(
                      color: kColor,
                      fontWeight: FontWeight.bold
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal:widget.screenWidth * .08 ),
          child: GridView.builder(
              shrinkWrap: true, // لجعل GridView تتكيف مع المحتوى
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // عدد العناصر في الصف
                crossAxisSpacing: 10, // المسافة بين العناصر أفقيًا
                mainAxisSpacing:10,

                mainAxisExtent: widget.screenWidth * 0.3,

                // المسافة بين العناصر عموديًا

              ),
              itemCount: viewall?12:9,
              itemBuilder: (context, snapshot) {
                return Container(

                  // width: screenWidth*.25,
                  // height: screenWidth*.23,
                  // alignment: Alignment.center,
                  decoration: BoxDecoration(

                    color: Color(0xffF8F8F8),
                    borderRadius: BorderRadius.circular(10),

                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    Image.asset(catgoryModels[snapshot].image,
                      height:  widget.screenWidth * .21,
                    ),
                    Text(catgoryModels[snapshot].title,
                      textAlign: TextAlign.center,
                      style: Styles.NexaBold14.copyWith(
                          fontSize: widget.screenWidth*.03,
                          color: kColor
                      ),
                    )

                  ],),
                );
              }
          ),
        ),
      ],
    );
  }
}

