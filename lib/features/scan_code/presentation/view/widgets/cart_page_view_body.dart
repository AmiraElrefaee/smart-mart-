import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_mart/const.dart';
import 'package:smart_mart/features/scan_code/presentation/view/widgets/section_payment_summary.dart';

import '../../../../../core/domain/entities/scanned_product_model.dart';
import '../../../../../core/utils/functions/app_router.dart';
import '../../../../../core/widgets/custom_botton.dart';
import '../../managers/     scanned_product_socket/scanned_product_socket_cubit.dart';

import 'custom_details_scanned_ittem.dart';
import 'custom_line.dart';

class CartPageViewBody extends StatefulWidget {
  const CartPageViewBody({super.key});

  @override
  _CartPageViewBodyState createState() => _CartPageViewBodyState();
}

class _CartPageViewBodyState extends State<CartPageViewBody> {
  final List<Product> _products = []; // ليست محلية لتخزين المنتجات
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>(); // مفتاح للـ AnimatedList
  @override
  void initState() {
    super.initState();
    // _products.add(Product(
    //   id: 'test_id',
    //   title: 'Test Product',
    //   price: 10,
    //   imageUrl: 'https://example.com/image.jpg', quantity: 1, brand: '', description: '', highlights: '', barcode: '', stock: 0, itemWeight: '', subCategoryId: '',
    //   // أي بيانات تانية مطلوبة
    // ));
    // _listKey.currentState?.insertItem(_products.length - 1);
  }
  // void initState() {
  //   super.initState();
  //   // تأكدي من أن الكيوبت مُهيأ بشكل صحيح
  //   context.read<ScannedProductSocketCubit>();
  // }
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return BlocConsumer<ScannedProductSocketCubit, ScannedProductSocketState>(
      listener: (context, state) {
        print('annnnnnnnnnnnnnnnnnn✅✅✅✅✅✅✅ ');
        if (state is ScannedProductsLoaded) {
          setState(() {
            final newProduct = state.products;

            // نشوف إذا المنتج موجود قبل كدا
            final existingIndex = _products.indexWhere((p) => p.id == newProduct.id);
            if (existingIndex != -1) {
              // نحذفه مع أنيميشن
              final removedProduct = _products.removeAt(existingIndex);
              _listKey.currentState?.removeItem(
                _products.length - existingIndex,
                    (context, animation) => SizeTransition(
                  sizeFactor: animation,
                  child: SizedBox(), // ممكن تضيفي الشكل القديم هنا لو حابة
                ),
              );
            }

            // نضيف المنتج الجديد في الآخر
            _products.add(newProduct);
            _listKey.currentState?.insertItem(_products.length - 1);
          });
        } else if (state is ScannedProductsError) {
          print('Error: ${state.message}');
        } else {
          print('nothingggggggggggggggggggggggg ✅✅✅✅✅✅✅ ');
        }
      },
      builder: (context, state) {
        if (state is ScannedProductsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ScannedProductsError) {
          return SizedBox(
            height: 500,
            width: 400,
            child: Center(child: Text('Error: ${state.message}')),
          );
        }

        else   return _products.isEmpty
              ? SectionNothingInCart()
              : Section_show_added_pproduct(
            screenHeight: screenHeight,
            listKey: _listKey,
            products: _products,
            screenWidth: screenWidth,
          );
      },
    );
  }
}

class SectionNothingInCart extends StatelessWidget {
  const SectionNothingInCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBarCartPage(
          number: 0,
        ),
        Spacer(),
        Image.asset('assets/items/empty-cart 1.png'),
        Text(
          'There’s nothing in your cart yet !',
          style: TextStyle(
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        Text(
          'Add item to your Basket ',
          style: TextStyle(
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.w500,
            fontSize: 19,
            color: Color(0xff989797),
          ),
        ),
        Spacer(flex: 2),
      ],
    );
  }
}

class CustomAppBarCartPage extends StatelessWidget {
  const CustomAppBarCartPage({super.key, required this.number});
final num number;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              context.go(AppRouter.kScanPage);
            },
            icon: const Icon(Icons.arrow_back_ios_new_sharp),
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Your Cart',
                    style: TextStyle(
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    '( $number items )',
                    style: TextStyle(
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Color(0xff989797),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.shopping_cart,
                    color: Color(0xff00CA25),
                  ),
                  Text(
                    '  connected to Basket',
                    style: TextStyle(
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Color(0xff00CA25),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }
}

class Section_show_added_pproduct extends StatelessWidget {
  const Section_show_added_pproduct({
    super.key,
    required this.screenHeight,
    required GlobalKey<AnimatedListState> listKey,
    required List<Product> products,
    required this.screenWidth,
  })  : _listKey = listKey,
        _products = products;

  final double screenHeight;
  final GlobalKey<AnimatedListState> _listKey;
  final List<Product> _products;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,

      child: CustomScrollView(
        // physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: CustomAppBarCartPage(
              number: _products.length,
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: screenHeight * 0.5,
              child: AnimatedList(
                physics: NeverScrollableScrollPhysics(),
                // reverse: true,

                key: _listKey,
                initialItemCount: _products.length,
                itemBuilder: (context, index, animation) {
                  return SlideTransition(
                    position: animation.drive(
                      Tween<Offset>(
                        begin: const Offset(-1, 0), // يبدأ من الشمال
                        end: Offset.zero,
                      ).chain(CurveTween(curve: Curves.easeInOut)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: screenWidth * 0.06,
                      ),
                      child: customDetailsSCannedItem(
                        index: index,
                        products: _products,
                        screenHeight: screenHeight,
                        screenWidth: screenWidth,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                customLine2(screenWidth: screenWidth),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
                  width: screenWidth,
                  margin: EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: screenWidth * 0.06,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xffF8F8F8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SectionPaymentSummary(
                    products: _products,
                    screenWidth: screenWidth,
                  ),
                ),
                 Padding(
                   padding: const EdgeInsets.all(10),
                   child: CustomBotton(text: 'Checkout',
                    background: kColor, colorText: Colors.white, screenHeight: MediaQuery.of(context).size.height, screenWidth: MediaQuery.of(context).size.width, onTap: () {
                     context.push(AppRouter.kPayment);

                     },),
                 )
              ],
            ),
          ),

        ],
      ),
    );
  }
}