import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_mart/features/details_item/presentation/views/widgets/section_arrow_back.dart';
import 'package:smart_mart/features/details_item/presentation/views/widgets/section_description_and_higlight.dart';
import 'package:smart_mart/features/details_item/presentation/views/widgets/section_open_link.dart';
import 'package:smart_mart/features/details_item/presentation/views/widgets/section_prices.dart';
import 'package:smart_mart/features/details_item/presentation/views/widgets/section_show_product_photo.dart';
import 'package:smart_mart/features/home/presentation/views/widgets/custom_search_bar.dart';
import 'package:smart_mart/features/scan_code/presentation/view/widgets/details_scan_product_view.dart';
import 'package:smart_mart/features/scan_code/presentation/view/widgets/section_add_or_scaa.dart';
import 'package:smart_mart/features/scan_code/presentation/view/widgets/section_top_bar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../const.dart';
import '../../../../../core/utils/styles.dart';
import '../../../home/presentation/views/widgets/Custom_show_item.dart';


class DetailsSacnProduct extends StatelessWidget {
  const DetailsSacnProduct({super.key,

    required this.controller,
  });


final ScrollController controller;


  @override
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return
       Stack(
        children: [
          // Scrollable content
          DetailsScanProductView(controller: controller, screenWidth: screenWidth),

          // Fixed Top Bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SectionTopBar(),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: SectionAddOrScan(

              ))
        ]);

  }}

