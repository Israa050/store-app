



import 'package:json_annotation/json_annotation.dart';

part 'review.g.dart';

@JsonSerializable()
class ReviewModel {
  String? message;
  double? averageRating;
  int? reviewsCount;
  Reviews? reviews;

  ReviewModel(
      {this.message, this.averageRating, this.reviewsCount, this.reviews});

  factory ReviewModel.fromJson(Map<String, dynamic> json) => _$ReviewModelFromJson(json);
}


@JsonSerializable()
class Reviews {
  List<Items>? items;
  int? page;
  int? pageSize;
  int? totalCount;
  bool? hasNextPage;
  bool? hasPreviousPage;

  Reviews(
      {this.items,
      this.page,
      this.pageSize,
      this.totalCount,
      this.hasNextPage,
      this.hasPreviousPage});

  factory Reviews.fromJson(Map<String, dynamic> json)=> _$ReviewsFromJson(json);

}


@JsonSerializable()
class Items {
  String? comment;
  int? rating;
  String? createdAt;
  String? userName;
  String? userPicture;

  Items(
      {this.comment,
      this.rating,
      this.createdAt,
      this.userName,
      this.userPicture});

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);

}