



import 'package:json_annotation/json_annotation.dart';

part 'offer.g.dart';

@JsonSerializable()
class Offers {
  Offer? offers;

  Offers({this.offers});

 factory Offers.fromJson(Map<String, dynamic> json) => _$OffersFromJson(json);
}


@JsonSerializable()
class Offer {
  List<Items>? items;
  int? page;
  int? pageSize;
  int? totalCount;
  bool? hasNextPage;
  bool? hasPreviousPage;

  Offer(
      {this.items,
      this.page,
      this.pageSize,
      this.totalCount,
      this.hasNextPage,
      this.hasPreviousPage});

  factory Offer.fromJson(Map<String, dynamic> json) => _$OfferFromJson(json);

}


@JsonSerializable()
class Items {
  String? id;
  String? name;
  String? description;
  String? coverUrl;
  String? createdAt;

  Items({this.id, this.name, this.description, this.coverUrl, this.createdAt});

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);

}
