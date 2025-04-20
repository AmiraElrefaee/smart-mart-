import '../../domain2/entity/entity_scanned_item.dart';

class ProductModel extends Product {
  ProductModel({
    required super.id,
    required super.price,
    required super.weight,
    required super.description,
    required super.image,
  });


  factory ProductModel.fromFirestore(Map<String, dynamic> data, String docId) {
    return ProductModel(
      image:data['image'] ,
      id: docId,
      price: (data['price'] ),
      weight: (data['weight'] ),
      description: data['description'] ?? '',
    );
  }
}
