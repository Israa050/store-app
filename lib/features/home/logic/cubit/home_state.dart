part of 'home_cubit.dart';


sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class Loading extends  HomeState {}

final class Success extends HomeState {
  final Products products;
  final CategoryModel category;
  final Offers offers;

  Success({required this.products,required this.category,required this.offers});

}

final class ProductsSuccess extends HomeState{
  final Products products;

  ProductsSuccess({required this.products});
}

final class CategoriesSuccess extends HomeState{
  final CategoryModel categoryModel;

  CategoriesSuccess({required this.categoryModel});
}

final class OffersSuccess extends HomeState {

  final Offers offers;

  OffersSuccess({required this.offers});
}

final class Faliuare extends HomeState {
  final ApiErrorModel error;

  Faliuare({required this.error});
}
