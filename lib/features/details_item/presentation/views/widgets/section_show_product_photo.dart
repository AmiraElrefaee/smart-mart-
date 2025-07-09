import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/widgets/custom_love_botton.dart';
import '../../../../whishList/presentation/managers/whish_list_cubit/whish_list_cubit.dart';

class SectionShowProductPhoto extends StatelessWidget {
  const SectionShowProductPhoto({
    super.key,
    required this.screenWidth, required this.photo, required this.id,
  });

  final double screenWidth;
  final String photo;
  final String id;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 335.w,
          height: 253.h,
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(vertical: screenWidth*.06),
          decoration: BoxDecoration(
              color: Color(0xffF8F8F8),
              borderRadius: BorderRadius.circular(8)
          ),
          child: SizedBox(
            // width: 172.w,
            height: 228.h,
            child: CachedNetworkImage(
              imageUrl: photo.startsWith('http') ? photo : 'https://th.bing.com/th/id/OIP.eKE8nrMRCK3bdvd62kWJ_wHaEK?w=306&h=180&c=7&r=0&o=5&pid=1.7',
              fit: BoxFit.fill,
              placeholder: (context, url) => Container(
                color: Colors.grey.shade300,
                child: const Center(child: CircularProgressIndicator()),
              ),
              errorWidget: (context, url, error) => Container(
                color: Colors.grey.shade300,
                child: const Center(child: Icon(Icons.error)),
              ),
            ),
          ),
          // Image.asset('assets/items/image 47.png',
          //   // height: screenWidth*.55,
          // ),
        ),

        Positioned(
            left: screenWidth*.75,
            top: screenWidth*.12,
            child:customLoveBotton(
                screenWidth: screenWidth,
                itemId: id,
                hight: 21.h,
                width:24.w,
                isLoved: context.watch<WhishListCubit>().isInWishlist(id)
            )
        ),
        Positioned(
            left: screenWidth*.78,
            top: screenWidth*.23,
            child: InkWell(
              onTap: (){},
              child: SvgPicture.asset('assets/icons/Vector (5).svg',
                height: 18.h,
                width: 16.h,
              ),
            )),
      ],
    );
  }
}

