part of 'search_qr_code_cubit.dart';

@immutable
sealed class SearchQrCodeState {}

final class SearchQrCodeInitial extends SearchQrCodeState {}
final class SearchQrCodeLoading extends SearchQrCodeState {}
final class SearchQrCodeSuccess extends SearchQrCodeState {
  ItemModel product;
  SearchQrCodeSuccess(this.product);
}
final class SearchQrCodeFail extends SearchQrCodeState {}
