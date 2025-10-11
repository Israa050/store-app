part of 'product_cubit.dart';

sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class Loading extends ProductState{}

final class ProductSuccuss extends ProductState{
  final Product product;
  final Items review;
  ProductSuccuss({required this.product, required this.review});
}

final class Faliuare extends ProductState{
  final ApiErrorModel error;

  Faliuare({required this.error});
}
