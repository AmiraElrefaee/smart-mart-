import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../const.dart';
import '../../../../core/domain/entities/item_model.dart';
import '../../../../core/widgets/custom_love_botton.dart';
import '../managers/whish_list_cubit/whish_list_cubit.dart';

class customLovedItem extends StatefulWidget {
  final ItemModel items;
  final double ScreenWidht;

  const customLovedItem({
    super.key,
    required this.ScreenWidht,
    required this.items,
  });

  @override
  State<customLovedItem> createState() => _customLovedItemState();
}

class _customLovedItemState extends State<customLovedItem> {
  bool _isVisible = true;

  void _handleRemove() async {
    setState(() => _isVisible = false); // ✨ تخفي تدريجيًا
    await Future.delayed(Duration(milliseconds: 300));

    if (mounted) {
      await context.read<WhishListCubit>().removeFromWhishList(idItem: widget.items.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    num before = widget.items.price - ((widget.items.price) * (widget.items.discount / 100)).toInt();
    return AnimatedOpacity(
      duration: Duration(milliseconds: 300),
      opacity: _isVisible ? 1.0 : 0.0,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 17, vertical: 18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: Color(0xffDADADA)),
        ),
        child: Row(
          children: [
            // صورة
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 20),
              child: CachedNetworkImage(
                height: 88.h,
                width: 73.w,
                imageUrl: widget.items.image,
                fit: BoxFit.fill,
              ),
            ),

            // معلومات المنتج
            SizedBox(
              width: 150.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.items.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                          fontFamily: 'Urbanist',
                          color: Color(0xff484C52))),
                  Text(' ${widget.items.itemWeight} gm ',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                          fontFamily: 'Urbanist',
                          color: Color(0xff484C52))),
                  Row(
                    children: [
                      Text('EGP ${widget.items.price}',
                          style: TextStyle(
                              color: kColor,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w600)),
                      Text(' EGP ${before}',
                          style: TextStyle(
                            color: Color(0xff989797),
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.lineThrough,
                          )),
                    ],
                  ),
                  Container(
                    width: 60.w,
                    height: 23.h,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: widget.items.discount == 0 ? Colors.transparent : Color(0xff72FC97),
                    ),
                    child: widget.items.discount == 0
                        ? SizedBox.shrink()
                        : Text('${widget.items.discount}% OFF',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Urbanist',
                          fontSize: 10.sp,
                          color: Color(0xff484C52),
                        )),
                  )
                ],
              ),
            ),

            // فاصل وخانة القلب
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: 48,
              width: 1,
              color: Color(0xffDADADA),
            ),

            // زر القلب
            customLoveBotton(
              screenWidth: widget.ScreenWidht,
              itemId: widget.items.id,
              hight: 19.h,
              width: 22.w,
              isLoved: context.read<WhishListCubit>().isInWishlist(widget.items.id),
              onTap: _handleRemove,
            ),
          ],
        ),
      ),
    );
  }
}
