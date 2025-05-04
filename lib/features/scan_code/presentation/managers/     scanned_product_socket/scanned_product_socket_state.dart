part of 'scanned_product_socket_cubit.dart';


sealed class ScannedProductSocketState {}

final class ScannedProductSocketInitial extends ScannedProductSocketState {}
class ScannedProductsLoading extends ScannedProductSocketState {}

class ScannedProductsLoaded extends ScannedProductSocketState {

  final Product  products;

  ScannedProductsLoaded(this.products);
}
class ScannedCartSucess extends ScannedProductSocketState {

final String mesaage;
ScannedCartSucess(this.mesaage);
}
// class ScannedProductError extends ScannedProductSocketState {
//   final String  message;
//
//   ScannedProductError(this.message);
// }

class ScannedProductsError extends ScannedProductSocketState {
  final String message;

  ScannedProductsError(this.message);
}