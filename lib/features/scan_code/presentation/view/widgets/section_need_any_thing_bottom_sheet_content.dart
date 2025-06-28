// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';
// import 'package:smart_mart/core/utils/functions/app_router.dart';
// import 'package:smart_mart/features/scan_code/presentation/view/widgets/top_need_anything_sheet.dart';
//
// import '../../../../../const.dart';
// import '../../../../../core/utils/functions/Navigate_to_page.dart';
// import '../../../../home/presentation/views/widgets/Custom_show_discount_item.dart';
// import 'bottons_scanned_item.dart';
//
// class sectionNeedAnyThingBottomSheetContent extends StatelessWidget {
//   const  sectionNeedAnyThingBottomSheetContent({
//     super.key,
//     required this.screenHeight,
//     required this.screenWidth, required this.cameraController,
//   }
//
//   );
//
//   final double screenHeight;
//   final double screenWidth;
//   final MobileScannerController cameraController;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: screenHeight*.85,
//       color: Colors.white,
//       child: Stack(
//         children: [
//           CustomScrollView(
//             physics: BouncingScrollPhysics(),
//             slivers: [
//               SliverToBoxAdapter(child: SizedBox(
//                 height: 120,
//               ),),
//
//
//               SliverGrid(delegate: SliverChildBuilderDelegate((context,index){
//                 return Padding(
//                   padding:  EdgeInsets.symmetric(horizontal: screenWidth*.03),
//                   child: CustomShowDiscountItem(
//                     screenWidth: screenWidth,
//                   ),
//                 );
//
//               },
//                 childCount:40,
//               ),
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//
//                     crossAxisCount: 2, // عدد العناصر في الصف
//                     crossAxisSpacing: 5, // المسافة بين العناصر أفقيًا
//                     mainAxisSpacing:10,
//                     mainAxisExtent: screenWidth*.58 ,// Width/Height ratio
//                   )
//
//               )
//             ],
//           ),
//           Positioned(
//             top: 0,
//             left: 0,
//             right: 0,
//             child: Container(
//               padding: EdgeInsets.only(bottom: 20,
//                   top: 20
//               ),
//               decoration: BoxDecoration(
//                 color: Colors.white, // Background color
//                 borderRadius: BorderRadius.circular(10),
//                 boxShadow: [
//                   BoxShadow(
//                     color:ksecodaryColor.withOpacity(0.1), // Shadow color with opacity
//                     spreadRadius: .5, // How much the shadow spreads
//                     blurRadius: 2, // Blurriness of the shadow
//                     offset: Offset(0, 4), // Moves shadow down (X: 0, Y: 4)
//                   ),
//                 ],
//               ),
//               child: Column(children: [
//                 Container(
//                   margin:EdgeInsets.only(
//                       bottom: 25
//                   ),
//                   width: MediaQuery.of(context).size.width*.35,
//                   height: 5,
//
//                   decoration: BoxDecoration(
//                       color: Color(0xffDADADA),
//                       borderRadius: BorderRadius.circular(20)
//                   ),
//
//                 ),
//                 TopNeddAnyThingSheet(),
//
//
//               ],),
//             ),),
//           Positioned(
//               bottom: 0,
//               left: 0,
//               right: 0,
//               child: bottonsScannedItem(onTap: (){
//                 cameraController.stop();
//                 navigateToPage( AppRouter.kPayment,context);
//               },))
//         ],
//       ),
//     );
//   }
// }
//
