class Product {
  final String id;
  final String title;
  final num price;
  final String brand;
  final String description;
  final String highlights;
  final String imageUrl;
  final String barcode;
  final int stock;
  final String itemWeight;
  final String subCategoryId;
  final num quantity;
  final num duscount;

  Product( {
   required this.quantity,
    required this.id,
    required this.title,
    required this.price,
    required this.brand,
    required this.description,
    required this.highlights,
    required this.imageUrl,
    required this.barcode,
    required this.stock,
    required this.itemWeight,
    required this.subCategoryId,
    required this.duscount
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      quantity: json['quantity']??1,
      id: json['_id'],
      title: json['title'],
      price: json['price'] ??0,
      brand: json['brand'],
      description: json['description'],
      highlights: json['highlights'],
      imageUrl: json['image_url'],
      barcode: json['barcode'],
      stock: json['stock'],
      itemWeight: json['item_weight'],
      subCategoryId: json['subCategoryId'],
      duscount:json['discount'] ??0
    );
  }
}
