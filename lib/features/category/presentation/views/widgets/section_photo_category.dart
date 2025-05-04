import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SectionPhotoCategory extends StatelessWidget {
  const SectionPhotoCategory({
    super.key,
    required this.screenWidth, required this.photo, required this.title,
  });

  final double screenWidth;
final String photo;
final String title ;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: screenWidth * .04),
      width: screenWidth,
      height: screenWidth * .4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          fit: StackFit.expand,
          children: [
            CachedNetworkImage(
              imageUrl:photo,
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
            Container(
              color: Colors.black.withOpacity(0.3), // تظليل شفاف
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  Text(
                     title,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                  // Text(
                  //   'Extra care for your baby',
                  //   style: TextStyle(
                  //     fontWeight: FontWeight.w600,
                  //     fontSize: 17,
                  //     color: Colors.white,
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
