import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_mart/core/domain/entities/item_model.dart';
import 'package:smart_mart/features/details_item/presentation/views/widgets/section_arrow_back.dart';
import 'package:smart_mart/features/details_item/presentation/views/widgets/section_description_and_higlight.dart';
import 'package:smart_mart/features/details_item/presentation/views/widgets/section_open_link.dart';
import 'package:smart_mart/features/details_item/presentation/views/widgets/section_prices.dart';
import 'package:smart_mart/features/details_item/presentation/views/widgets/section_show_product_photo.dart';
import 'package:smart_mart/features/home/presentation/views/widgets/custom_search_bar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../const.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../category/data/models/sub_category_model.dart';
import '../../../../home/presentation/views/widgets/Custom_show_item.dart';
import '../../../../home/presentation/views/widgets/custom_price.dart';

class DetailsPageViewBody extends StatelessWidget {
  const DetailsPageViewBody({super.key, required this.item});

final ItemModel item;

  @override
  Widget build(BuildContext context) {
    // final state = GoRouterState.of(context);
    // final item = state.extra;

    if (item == null || item is! ItemModel) {
      return Scaffold(
        body: Center(
          child: Text(
            'حدث خطأ أثناء تحميل بيانات المنتج',
            style: TextStyle(color: Colors.red, fontSize: 18),
          ),
        ),
      );
    }
    final double screenWidth=MediaQuery.of(context).size.width;
    return SafeArea(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: screenWidth*.057,
        // vertical: screenWidth*.08
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Row(
                children: [
                  sectonArrowBack(screenWidth: screenWidth),
                  SizedBox(
                    width: screenWidth*.77,
                    child:CustomSearchBar(
                        readOnly: true,
                        screenWidth: screenWidth) ),
                ],
              ),
            ),
              SectionShowProductPhoto(screenWidth: screenWidth,
              photo: item.image,
              ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionOpenLink(
                  brand: item.brand,
                ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  margin:  EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      color: Color(0xffDADADA),
                      borderRadius: BorderRadius.circular(8)
                  ),
                  child: Text('Pasta',
                    style:Styles.Urbanist16,)),
              Text(item.title,
                style: Styles.Urbanist16.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: screenWidth*.04,
                    color: Colors.black
                ),

              ), Text('( ${item.itemWeight}gm )',
                style:Styles.Urbanist16.copyWith(
                  color: Color(0xff484C52),
                  fontWeight: FontWeight.w600,
                  fontSize: screenWidth*.042,
                ),),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SectionPrices(
                  price: item.price,
                  discount: item.discount,
                ),
              ),
            ],),
          ),

            SectionDEscriptionAndHighlight(screenWidth: screenWidth,
              Description: item.description,
              highlights: item.highlights,

            ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text('Similar Products',
                style: Styles.Urbanist25,
                ),
              ),
              SizedBox(
                height: screenWidth*.48,
                child: ListView.builder(
                  shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context,index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: screenWidth*.03),
                          width:screenWidth*.46,
                          // height:screenWidth*.56 ,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(

                              color: Color(0xffD9D9D9), // لون الحدود
                              width: 1, // سمك الحدود
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Center(
                                child: Image.asset('assets/items/image (1).png',
                                  height: screenWidth*.25,
                                ),
                              ),
                            ),
                            Text('Eldoha Easy Pasta Italian Red Sauce Pasta ',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: Styles.NexaBold14.copyWith(

                                  fontWeight: FontWeight.w500,
                              ),

                            ),
                            Text('- 185gm',
                                style: Styles.NexaBold14.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff484C52)
                                )),

                          ],),
                        ),
                      );
                    }
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30,
                bottom: 20
                ),
                child: Text('Frequently Bought Together',
                  style: Styles.Urbanist25,
                ),
              ),
              SizedBox(
                height: screenWidth*.61,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context,index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: CustomShowItem(screenWidth: screenWidth,item: BestSeller(
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
              SizedBox(height: 150,)
          ],),



        ),


      ),


    );
  }

}

