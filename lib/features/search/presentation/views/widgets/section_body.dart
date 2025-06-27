import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_mart/features/search/presentation/views/widgets/search_page_view_body.dart';

import '../../../../../const.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../category/data/models/sub_category_model.dart';
import '../../../../home/data/models/categories_item.dart';
import '../../../../home/presentation/views/widgets/Custom_show_item.dart';
import 'custom_side_title_and_bottons.dart';
import 'custom_varial_item.dart';

class SectionBody extends StatelessWidget {
  const SectionBody({
    super.key,
    // required this.trendintItem,
    // required this.RecentItem,
    required this.screenWidth,
  });

  // final List<Map<String, dynamic>> trendintItem;
  // final List<Map<String, dynamic>> RecentItem;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    List <Map<String,dynamic> > trendintItem=[
      {'icons':Icons.trending_up, 'title':'Eldoha Pasta'},
      {'icons':Icons.trending_up, 'title':'Spuds'},
      {'icons':Icons.trending_up, 'title':'Molto'},
      {'icons':Icons.trending_up, 'title':'Body Splach'},
      {'icons':Icons.trending_up,'title': 'مولتو الجديد'},

    ];
    List <Map<String,dynamic> > RecentItem=[
      {'icons':FontAwesomeIcons.clockRotateLeft, 'title':' tiger'},
      {'icons':FontAwesomeIcons.clockRotateLeft, 'title':' tiger'},
      {'icons':FontAwesomeIcons.clockRotateLeft, 'title':' tiger'},
      {'icons':FontAwesomeIcons.clockRotateLeft, 'title':' tiger'},
      {'icons':FontAwesomeIcons.clockRotateLeft,'title': ' tiger'},

    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('On Trending',
          style: TextStyle(
              color: kColor,
              fontFamily: 'Urbanist',
              fontSize: 16,
              fontWeight: FontWeight.w500
          ),
        ),


        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: CustomVrialItem(Item:trendintItem,),
        ),

        Padding(
          padding: const EdgeInsets.only( right:10,
              top: 20,
              bottom: 20
          ),
          child: CustomSideTitleAndBotton(
            title: 'Recent searches',
            botton: 'clear all',
            onTap: (){},
          ),
        ),

        CustomVrialItem(Item:RecentItem,),

        Padding(
          padding: const EdgeInsets.only( right:10,
              top: 20,
              bottom: 20
          ),
          child: CustomSideTitleAndBotton(
            title: 'Pick up For you',
            botton: 'view all',
            onTap: (){},
          ),
        ),



        SizedBox(
          height: screenWidth *.6,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context,index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: CustomShowItem(screenWidth: screenWidth,
                    item: BestSeller(
                      state: 'available',
                      id: '1',
                      title: 'Sample Item',
                      price: 100.0,
                      brand: 'Sample Brand',
                      description: 'Sample Description',
                      highlights: 'Sample Highlights',
                      barcode: '123456789',
                      stock: 10,
                      itemWeight: '500g',
                      subCategoryId: 'sub1',
                      categoryId: 'cat1',
                      sold: 50,
                      image: 'sample_image_url',
                      rating: 4.5,
                      discount: 10,
                      createdAt: '2025-04-26',
                    ),
                  ),
                );
              }
          ),
        ),

        Padding(
          padding: const EdgeInsets.only( right:10,
              top: 20,
              bottom: 20
          ),
          child: CustomSideTitleAndBotton(
            title: 'Search by Categories',
            botton: 'view all',
            onTap: (){},
          ),
        ),

        SizedBox(
          height:   screenWidth*.3,

          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: catgoryModels.length,
              itemBuilder: (context,index){
                return Container(
                    margin:EdgeInsets.only(right: screenWidth*.02) ,
                    // padding:EdgeInsets.all( screenWidth*.01) ,
                    width: screenWidth*.28,
                    height: screenWidth*.1,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(

                      color: Color(0xffF8F8F8),
                      borderRadius: BorderRadius.circular(10),

                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(catgoryModels[index].image,
                            height:  screenWidth * .21,

                          ),
                          Text(catgoryModels[index].title,
                            textAlign: TextAlign.center,
                            style: Styles.NexaBold14.copyWith(
                                fontSize: screenWidth*.03,
                                color: kColor
                            ),
                          )

                        ]));}
          ),
        ),],);
  }
}
