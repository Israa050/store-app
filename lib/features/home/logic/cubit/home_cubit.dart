import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/networking/api_error_model.dart';
import 'package:store_app/features/home/data/models/category.dart';
import 'package:store_app/features/home/data/models/offer.dart';
import 'package:store_app/features/home/data/models/product.dart';
import 'package:store_app/features/home/data/repos/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;
  HomeCubit({required this.homeRepo}) : super(HomeInitial());

  

  Future<void> getProducts() async {
    emit(Loading());
    final result = await homeRepo.getProducts();
   
    result.when(onSuccess: (data) {
      emit(ProductsSuccess(products: data));
    }, onError: (error) {
      emit(Faliuare(error: error));
    });

  }

  Future<void> getCategories() async {
    emit(Loading());
    final result = await homeRepo.getCategories();
    result.when(onSuccess: (data) {
      emit(CategoriesSuccess(categoryModel: data));
    }, onError: (error) {
      emit(Faliuare(error: error));
    });
  }

  Future<void> getOffers() async {
    emit(Loading());
    final result = await homeRepo.getOffers();
    result.when(onSuccess: (data) {
      emit(OffersSuccess(offers: data));
    }, onError: (error) {
      emit(Faliuare(error: error));
    });

  }

  //test

  Future<void> getHomeData() async {
    emit(Loading());

    try {
      // Run all three calls in parallel
      final results = await Future.wait([
        homeRepo.getProducts(),
        homeRepo.getCategories(),
        homeRepo.getOffers(),
      ]);

      // Each call returns an ApiResult or similar wrapper
      final productsResult = results[0];
      final categoriesResult = results[1];
      final offersResult = results[2];

      // We’ll need to check if any failed
      late Products products;
      late CategoryModel categories;
      late Offers offers;

      bool hasError = false;
      ApiErrorModel? errorModel;

      productsResult.when(
        onSuccess: (data) => products = data as Products,
        onError: (error) {
          hasError = true;
          errorModel = error;
        },
      );

      categoriesResult.when(
        onSuccess: (data) => categories = data as CategoryModel,
        onError: (error) {
          hasError = true;
          errorModel = error;
        },
      );

      offersResult.when(
        onSuccess: (data) => offers = data as Offers,
        onError: (error) {
          hasError = true;
          errorModel = error;
        },
      );

      if (hasError) {
        emit(Faliuare(error: errorModel!));
      } else {
        emit(Success(
          products: products,
          category: categories,
          offers: offers,
        ));
      }
    } catch (e) {
      emit(Faliuare(error: ApiErrorModel(message: e.toString(), statusCode: null, errors: [], icon: null)));
    }
  }


  

  
}
