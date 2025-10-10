

import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';


@JsonSerializable()
class Products {
  List<Product>? items;
  int? page;
  int? pageSize;
  int? totalCount;
  bool? hasNextPage;
  bool? hasPreviousPage;

  Products(
      {this.items,
      this.page,
      this.pageSize,
      this.totalCount,
      this.hasNextPage,
      this.hasPreviousPage});

  factory Products.fromJson(Map<String, dynamic> json) =>
      _$ProductsFromJson(json);
}



@JsonSerializable()
class Product {
  final String? id;
  final String? productCode;
  final String? name;
  final String? description;
  final String? arabicName;
  final String? arabicDescription;
  String? coverPictureUrl;
  final List<String>? productPictures;
  final double? price;
  final double? weight;
  final String? color;
  final double? rating;
  final int? reviewsCount;
  final int? discountPercentage;
  final String? sellerId;
  final List<String>? categories;

  Product({
    this.id,
    this.productCode,
    this.name,
    this.description,
    this.arabicName,
    this.arabicDescription,
    this.coverPictureUrl,
    this.productPictures,
    this.price,
    this.weight,
    this.color,
    this.rating,
    this.reviewsCount,
    this.discountPercentage,
    this.sellerId,
    this.categories
  });

   factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);


}
