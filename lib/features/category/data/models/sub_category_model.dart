import 'package:hive/hive.dart';
import '../../../../core/domain/entities/item_model.dart';

class SubCategoryModel {
  final String id;
  final String name;
  final String image;
  final String createdAt;
  final String backgroundImage;
  final ParentCategory parentCategory;
  final List<BestSeller> bestSellers;

  SubCategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.createdAt,
    required this.backgroundImage,
    required this.parentCategory,
    required this.bestSellers,
  });

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) {
    return SubCategoryModel(
      id: json['_id'] ?? 'null',
      name: json['name'] ?? 'null',
      image: json['image_url'] ?? 'null',
      createdAt: json['createdAt'] ?? 'null',
      backgroundImage: json['background_image'] ?? 'null',
      parentCategory: ParentCategory.fromJson(json['parent']),
      bestSellers: (json['bestSeller'] != null)
          ? (json['bestSeller'] as List)
          .map((e) => BestSeller.fromJson(e))
          .toList()
          : [],
    );
  }
}

class ParentCategory {
  final String id;
  final String name;
  final String image;
  final String backgroundImage;

  ParentCategory({
    required this.id,
    required this.name,
    required this.image,
    required this.backgroundImage,
  });

  factory ParentCategory.fromJson(Map<String, dynamic> json) {
    return ParentCategory(
      id: json['_id'] ?? 'null',
      name: json['name'] ?? 'null',
      image: json['image_url'] ?? 'null',
      backgroundImage: json['background_image'] ?? 'null',
    );
  }
}

class BestSeller implements ItemModel {
  final String _id;
  final String _subCategoryName;
  final String _state;
  final String _title; // Changed from title to _title
  final num _price; // Changed from price to _price
  final String _brand; // Changed from brand to _brand
  final String _description; // Changed from description to _description
  final String _highlights; // Changed from highlights to _highlights
  final String _barcode; // Changed from barcode to _barcode
  final int _stock; // Changed from stock to _stock
  final String _itemWeight; // Changed from itemWeight to _itemWeight
  final String _subCategoryId; // Changed from subCategoryId to _subCategoryId
  final String _categoryId; // Changed from categoryId to _categoryId
  final int _sold; // Changed from sold to _sold
  final String _image; // Changed from image to _image
  final num _rating; // Changed from rating to _rating
  final num _discount; // Changed from discount to _discount
  final String _createdAt; // Changed from createdAt to _createdAt

  BestSeller({
    required  String id,
    required String title,
    required String state,
    required num price,
    required String brand,
    required String description,
    required String highlights,
    required String barcode,
    required int stock,
    required String itemWeight,
    required String subCategoryId,
    required String categoryId,
    required int sold,
    required String image,
    required num rating,
    required num discount,
    required String createdAt,
    required String ?subCategoryName,

  })  : _title = title,
        _id=id,
        _subCategoryName=subCategoryName ??'',
        _state=state,
        _price = price,
        _brand = brand,
        _description = description,
        _highlights = highlights,
        _barcode = barcode,
        _stock = stock,
        _itemWeight = itemWeight,
        _subCategoryId = subCategoryId,
        _categoryId = categoryId,
        _sold = sold,
        _image = image,
        _rating = rating,
        _discount = discount,
        _createdAt = createdAt;


  factory BestSeller.fromJson(Map<String, dynamic> json) {
    return BestSeller(
      state: json['state']?? 'null',
      id: json['_id'] ?? 'null',
      subCategoryName: json['subCategoryName']??'',
      title: json['title'] ?? 'null',
      price: json['price'] ?? 0,
      brand: json['brand'] ?? 'null',
      description: json['description'] ?? 'null',
      highlights: json['highlights'] ?? 'null',
      barcode: json['barcode'] ?? 'null',
      stock: json['stock'] ?? 0,
      itemWeight: json['item_weight'] ?? 'null',
      subCategoryId: json['subCategoryId'] ?? 'null',
      categoryId: json['categoryId'] ?? 'null',
      sold: json['sold'] ?? 0,
      image: json['image_url'] ?? 'null',
      rating: json['rating'] ?? 0,
      discount: json['discount'] ?? 0,
      createdAt: json['createdAt'] ?? 'null',
    );
  }

  @override
  String get title => _title; // Using private variable _title

  @override
  num get price => _price; // Using private variable _price

  @override
  String get brand => _brand; // Using private variable _brand
  @override
  String get id => _id;

  @override
  String get description => _description; // Using private variable _description

  @override
  String get highlights => _highlights; // Using private variable _highlights

  @override
  String get barcode => _barcode; // Using private variable _barcode

  @override
  int get stock => _stock; // Using private variable _stock

  @override
  String get itemWeight => _itemWeight; // Using private variable _itemWeight

  @override
  String get subCategoryId => _subCategoryId; // Using private variable _subCategoryId

  @override
  String get categoryId => _categoryId; // Using private variable _categoryId

  @override
  int get sold => _sold; // Using private variable _sold

  @override
  String get image => _image; // Using private variable _image

  @override
  num get rating => _rating; // Using private variable _rating

  @override
  num get discount => _discount; // Using private variable _discount

  @override
  String get createdAt => _createdAt; // Using private variable _createdAt
  @override
  String get state => _state;

  @override

  String get subCategoryName => _subCategoryName ??'';
}
