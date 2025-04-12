import 'package:hive/hive.dart';

import '../../dmain/entity/categoty_entity.dart';
part 'category_model.g.dart';

@HiveType(typeId: 0)

class CategoryModel extends CategoryEntity{
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String image;
  @HiveField(3)
  final String createdAt;

  CategoryModel({required this.id,
    required this.name,
    required this.image,
    required this.createdAt}) : super(id: id, name:name, image: image, createdAt:createdAt);

  factory  CategoryModel.fromJson(Map<String ,dynamic>json){
    return CategoryModel(
        id: json['_id']?? 'null',
        name: json['name']??'null',
        image: json['image_url'] ??'null',
        createdAt: json['createdAt'] ??'null');
  }

  // Map<String, String> toJson() {
  //   return {
  //     'id': id,
  //     'name': name,
  //     'image':image,
  //     'createdAt':createdAt
  //   };
  // }
}