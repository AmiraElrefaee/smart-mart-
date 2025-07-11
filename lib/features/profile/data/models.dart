class ProductModel {
  final String id;
  final String title;
  final String imageUrl;
  final int price;
  final int discount;
  final String brand;
  final String? description;
  final String? barcode;
  final int? stock;
  final String? itemWeight;
  final int? shelfNumber;
  final String? stockState;

  ProductModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.discount,
    required this.brand,
    this.description,
    this.barcode,
    this.stock,
    this.itemWeight,
    this.shelfNumber,
    this.stockState,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id'] ?? '',
      title: json['title'] ?? '',
      imageUrl: json['image_url'] ?? '',
      price: json['price'] ?? 0,
      discount: json['discount'] ?? 0,
      brand: json['brand'] ?? '',
      description: json['description'],
      barcode: json['barcode'],
      stock: json['stock'],
      itemWeight: json['item_weight'],
      shelfNumber: json['shelfNumber'],
      stockState: json['stockState'],
    );
  }
}

class OrderItemModel {
  final ProductModel product;
  final int quantity;
  final int price;

  OrderItemModel({
    required this.product,
    required this.quantity,
    required this.price,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      product: ProductModel.fromJson(json['product']),
      quantity: json['quantity'],
      price: json['price'],
    );
  }
}
class OrderModel {
  final String id;
  final String userId;
  final List<OrderItemModel> items;
  final int totalPrice;
  final String status;
  final String paymentMethod;
  final String paymentIntentId;
  final String storeLocation;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  OrderModel({
    required this.id,
    required this.userId,
    required this.items,
    required this.totalPrice,
    required this.status,
    required this.paymentMethod,
    required this.paymentIntentId,
    required this.storeLocation,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    final items = (json['items'] as List)
        .map((item) => OrderItemModel.fromJson(item))
        .toList();

    return OrderModel(
      id: json['_id'] ?? '',
      userId: json['user'] ?? '',
      items: items,
      totalPrice: json['totalPrice'] ?? 0,
      status: json['status'] ?? '',
      paymentMethod: json['paymentMethod'] ?? '',
      paymentIntentId: json['paymentIntentId'] ?? '',
      storeLocation: json['storeLocation'] ?? '',
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      v: json['__v'] ?? 0,
    );
  }
}
