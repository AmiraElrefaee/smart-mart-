import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../const.dart';
import '../../../../../core/utils/styles.dart';

class SectionDEscriptionAndHighlight extends StatefulWidget {
  const SectionDEscriptionAndHighlight({
    super.key,
    required this.screenWidth,
    required this.Description,
    required this.highlights,
  });

  final double screenWidth;
  final String Description;
  final String highlights;
  @override
  State<SectionDEscriptionAndHighlight> createState() => _SectionDEscriptionAndHighlightState();
}

class _SectionDEscriptionAndHighlightState extends State<SectionDEscriptionAndHighlight> {
  bool showMore=false;
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.only(left: widget.screenWidth*.05,
          right: widget.screenWidth*.05,
          top: widget.screenWidth*.05
      ),
      decoration: BoxDecoration(
          color: Color(0xffF8F8F8),
          borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text('Description',
              style: Styles.Urbanist15.copyWith(
                  fontWeight: FontWeight.w600,
                fontSize: 14.sp

              ),
            ),
          ),

          Text(widget.Description,
            style: Styles.Urbanist13.copyWith(
                fontWeight: FontWeight.w600,
                color:kcolor3,
              fontSize: 13.sp
            ),
          ),

          Center(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              height: 1,
              width: widget.screenWidth*.5,
              color: Color(0xffDADADA),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text('Highlights',
              style: Styles.Urbanist15.copyWith(
                  fontWeight: FontWeight.w600,
                fontSize: 14.sp
              ),
            ),
          ),


               Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(widget.highlights,
                    maxLines: showMore ? null : 4,
                    style: Styles.Urbanist13.copyWith(
                        fontWeight: FontWeight.w600,
                        color:kcolor3,
                      fontSize: 13.sp
                    ),
                  ),
                ),


          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: TextButton(onPressed: (){
              setState(() {
                showMore=!showMore;
              });

            }, child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('show more',
                  style: Styles.Urbanist15.copyWith(
                      color: Color(0xff484C52),
                      fontWeight: FontWeight.w600
                  ),
                ),

                Icon(Icons.keyboard_arrow_down_outlined)
              ],)),
          )

        ],),
    );
  }
}

