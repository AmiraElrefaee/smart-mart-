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
  @HiveField(4)
  final String backGroundImage;

  CategoryModel({required this.id,
    required this.name,
    required this.image,
    required this.createdAt,
  required this.backGroundImage
  }) : super(id: id,
      name:name,
      image: image,
      createdAt:createdAt,
      backGroundImage: backGroundImage);

  factory  CategoryModel.fromJson(Map<String ,dynamic>json){
    return CategoryModel(
        id: json['_id']?? 'null',
        name: json['name']??'null',
        image: json['image_url'] ??'null',
        createdAt: json['createdAt'] ??'null',
        backGroundImage:json['background_image']?? 'null '
    );

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