// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';
// import 'package:smart_mart/features/scan_code/presentation/view/widgets/section_add_or_scaa.dart';
// import 'package:smart_mart/features/scan_code/presentation/view/widgets/section_need_any_thing_bottom_sheet_content.dart';
// import 'package:smart_mart/features/scan_code/presentation/view/widgets/section_payment_summary.dart';
// import 'package:smart_mart/features/scan_code/presentation/view/widgets/section_top_bar.dart';
// import 'package:smart_mart/features/scan_code/presentation/view/widgets/section_top_bar_scanned_item.dart';
// import '../../../../../core/domain/entities/scanned_product_model.dart';
// import '../../managers/     scanned_product_socket/scanned_product_socket_cubit.dart';
// import '../../managers/cubit_scanned_item/scanned_item_cubit.dart';
// import 'SectionAddMore.dart';
// import 'bottons_scanned_item.dart';
// import 'custom_add_or_minus.dart';
// import 'custom_details_scanned_ittem.dart';
// import 'custom_line.dart';
//
// class SectionShowScannedItem extends StatelessWidget {
//   const SectionShowScannedItem({super.key, required this.cameraController});
//
//  final  MobileScannerController cameraController;
//   @override
//   Widget build(BuildContext context) {
//     final double screenWidth = MediaQuery.of(context).size.width;
//     final double screenHeight = MediaQuery.of(context).size.height;
//
//
//     return BlocBuilder<ScannedProductSocketCubit, ScannedProductSocketState>(
//   builder: (context, state) {
//
//     if(state is ScannedProductsLoaded){
//      List<Product>  products=state.products;
//     return Container(
//       color: Colors.white,
//       height: screenHeight*.85,
//       child: Stack(
//         children: [
//           // Scrollable content using CustomScrollView
//         CustomScrollView(
//             physics: BouncingScrollPhysics(),
//             slivers: [
//               // List of products using SliverList
//               SliverToBoxAdapter(child: SizedBox(height: 120,)),
//               // SliverGrid(delegate: delegate, gridDelegate: gridDelegate),
//               SliverList(
//
//                 delegate: SliverChildBuilderDelegate((context, index) {
//                   return Padding(
//                       padding:  EdgeInsets.symmetric(vertical: 12,
//                      horizontal:screenWidth*.06
//                       ),
//                     child: customDetailsSCannedItem(
//                       index: state.products.length,
//                       products: products,
//                         screenHeight: screenHeight,
//                         screenWidth: screenWidth),
//                     );
//                   },
//                   childCount:products.length,
//                     addRepaintBoundaries:false
//                     // Replace with your actual item count
//                 ),
//               ),
//
//               // Additional content below the ListView
//               SliverToBoxAdapter(
//                 child: Column(
//
//                   children: [
//                     // Add any widgets you want below the ListView
//                     customLine2(screenWidth: screenWidth),
//                     Container(
//
//                       padding: EdgeInsets.symmetric(vertical: 18,
//                       horizontal: 12),
//                       width: screenWidth,
//                       margin: EdgeInsets.symmetric(vertical: 12,
//                         horizontal:   screenWidth*.06
//                       ),
//                       decoration: BoxDecoration(
//                         color: Color(0xffF8F8F8),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: SectionPaymentSummary(
//                           products:products,
//
//                           screenWidth: screenWidth),
//                     )
//                     // Add more widgets here if needed
//                   ],
//                 ),
//               ),
//               SliverToBoxAdapter(child: SizedBox(height: 120,)),
//             ],
//           ),
//
//           // Fixed Bottom Buttons
//           Positioned(
//               top: 0,
//               left: 0,
//               right: 0,
//               child: SectionTopBarScannedItem()),
//           Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             child: bottonsScannedItem(
//               onTap: (){
//                 showModalBottomSheet(
//                     isScrollControlled: true,
//                     useRootNavigator: true,
//                   context: context,
//                     builder: (context){
//                       return sectionNeedAnyThingBottomSheetContent(screenHeight: screenHeight, screenWidth: screenWidth,
//
//                           cameraController:cameraController
//                       ) ;
//                     }
//                 );
//               }
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//     else if (state is ScannedProductsLoading){
//       return  Center(child: CircularProgressIndicator());
//     }
//     else if  (state is ScannedProductsError){
//       print('the errrorrrr ${state.message}');
//       return SizedBox(
//           height: 500,
//           width: 400,
//           child: Center(child: Text('has error ${state.message} ')));
//     }
//     else  {
//       return Container(
//
//         padding: EdgeInsets.symmetric(vertical: 18,
//             horizontal: 12),
//         width: screenWidth,
//         margin: EdgeInsets.symmetric(vertical: 12,
//             horizontal:   screenWidth*.06
//         ),
//         decoration: BoxDecoration(
//           color: Color(0xffF8F8F8),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: SectionPaymentSummary(
//           products:[],
//
//             screenWidth: screenWidth),
//       );}
//     // } else if (state is ScannedItemState){
//     //   return SizedBox(
//     //       height: 500,
//     //       width: 400,
//     //       child: Center(child: Text('hm')));
//     // }
//     // else{
//     //   return SizedBox(
//     //       height: 500,
//     //       width: 400,
//     //       child: Center(child: Text('hmmmm')));
//     // }
//
//     },
// );
//   }
// }
//
