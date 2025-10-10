// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Offers _$OffersFromJson(Map<String, dynamic> json) => Offers(
  offers: json['offers'] == null
      ? null
      : Offer.fromJson(json['offers'] as Map<String, dynamic>),
);

Map<String, dynamic> _$OffersToJson(Offers instance) => <String, dynamic>{
  'offers': instance.offers,
};

Offer _$OfferFromJson(Map<String, dynamic> json) => Offer(
  items: (json['items'] as List<dynamic>?)
      ?.map((e) => Items.fromJson(e as Map<String, dynamic>))
      .toList(),
  page: (json['page'] as num?)?.toInt(),
  pageSize: (json['pageSize'] as num?)?.toInt(),
  totalCount: (json['totalCount'] as num?)?.toInt(),
  hasNextPage: json['hasNextPage'] as bool?,
  hasPreviousPage: json['hasPreviousPage'] as bool?,
);

Map<String, dynamic> _$OfferToJson(Offer instance) => <String, dynamic>{
  'items': instance.items,
  'page': instance.page,
  'pageSize': instance.pageSize,
  'totalCount': instance.totalCount,
  'hasNextPage': instance.hasNextPage,
  'hasPreviousPage': instance.hasPreviousPage,
};

Items _$ItemsFromJson(Map<String, dynamic> json) => Items(
  id: json['id'] as String?,
  name: json['name'] as String?,
  description: json['description'] as String?,
  coverUrl: json['coverUrl'] as String?,
  createdAt: json['createdAt'] as String?,
);

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'coverUrl': instance.coverUrl,
  'createdAt': instance.createdAt,
};
