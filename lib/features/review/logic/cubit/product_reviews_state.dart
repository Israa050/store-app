part of 'product_reviews_cubit.dart';

sealed class ProductReviewsState {}

final class ProductReviewsInitial extends ProductReviewsState {}

final class Loading extends ProductReviewsState{}

final class ProductReviwSuccess extends ProductReviewsState{
  final ReviewModel reviews;

  ProductReviwSuccess({required this.reviews});
}

final class Faliure extends ProductReviewsState{
  final ApiErrorModel error;

  Faliure({required this.error});
}
