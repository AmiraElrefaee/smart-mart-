import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../const.dart';
import '../../../../../core/utils/styles.dart';

class SectionDEscriptionAndHighlight extends StatefulWidget {
  const SectionDEscriptionAndHighlight({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

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
                  fontWeight: FontWeight.w600
              ),
            ),
          ),

          Text('Prepare a filling dish with the Pasta.'
              ' The pasta packs a great taste and satisfies your hunger pangs.'
              ' It gets ready in'
              ' minutes and makes a great addition to your everyday meal.',
            style: Styles.Urbanist13.copyWith(
                fontWeight: FontWeight.w600,
                color:kcolor3
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
                  fontWeight: FontWeight.w600
              ),
            ),
          ),

          ListView.builder(
              shrinkWrap: true,
              itemCount: showMore?6:4,
              itemBuilder: (context,index){

                return  Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text('.  Offers a sumptuous and layered flavor',
                    style: Styles.Urbanist13.copyWith(
                        fontWeight: FontWeight.w600,
                        color:kcolor3
                    ),
                  ),
                );
              }),

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

