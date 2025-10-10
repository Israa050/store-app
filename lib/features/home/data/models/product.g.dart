// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Products _$ProductsFromJson(Map<String, dynamic> json) => Products(
  items: (json['items'] as List<dynamic>?)
      ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
      .toList(),
  page: (json['page'] as num?)?.toInt(),
  pageSize: (json['pageSize'] as num?)?.toInt(),
  totalCount: (json['totalCount'] as num?)?.toInt(),
  hasNextPage: json['hasNextPage'] as bool?,
  hasPreviousPage: json['hasPreviousPage'] as bool?,
);

Map<String, dynamic> _$ProductsToJson(Products instance) => <String, dynamic>{
  'items': instance.items,
  'page': instance.page,
  'pageSize': instance.pageSize,
  'totalCount': instance.totalCount,
  'hasNextPage': instance.hasNextPage,
  'hasPreviousPage': instance.hasPreviousPage,
};

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
  id: json['id'] as String?,
  productCode: json['productCode'] as String?,
  name: json['name'] as String?,
  description: json['description'] as String?,
  arabicName: json['arabicName'] as String?,
  arabicDescription: json['arabicDescription'] as String?,
  coverPictureUrl: json['coverPictureUrl'] as String?,
  productPictures: (json['productPictures'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  price: (json['price'] as num?)?.toDouble(),
  weight: (json['weight'] as num?)?.toDouble(),
  color: json['color'] as String?,
  rating: (json['rating'] as num?)?.toDouble(),
  reviewsCount: (json['reviewsCount'] as num?)?.toInt(),
  discountPercentage: (json['discountPercentage'] as num?)?.toInt(),
  sellerId: json['sellerId'] as String?,
  categories: (json['categories'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
  'id': instance.id,
  'productCode': instance.productCode,
  'name': instance.name,
  'description': instance.description,
  'arabicName': instance.arabicName,
  'arabicDescription': instance.arabicDescription,
  'coverPictureUrl': instance.coverPictureUrl,
  'productPictures': instance.productPictures,
  'price': instance.price,
  'weight': instance.weight,
  'color': instance.color,
  'rating': instance.rating,
  'reviewsCount': instance.reviewsCount,
  'discountPercentage': instance.discountPercentage,
  'sellerId': instance.sellerId,
  'categories': instance.categories,
};
