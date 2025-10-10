

import 'package:json_annotation/json_annotation.dart';


part 'category.g.dart';


@JsonSerializable()
class CategoryModel {

  List<Categories>? categories;
 

 CategoryModel({this.categories});

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);


}





@JsonSerializable()
class Categories{

  final String? id;
  final String? name;
  final String? description;
  final String? coverPictureUrl;

  Categories({this.id, this.name, this.description, this.coverPictureUrl});


 factory Categories.fromJson(Map<String, dynamic> json) =>
      _$CategoriesFromJson(json);



}