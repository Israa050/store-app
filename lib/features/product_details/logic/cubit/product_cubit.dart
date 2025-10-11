import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/networking/api_error_model.dart';
import 'package:store_app/features/home/data/models/product.dart';
import 'package:store_app/features/product_details/data/repos/product_repo.dart';
import 'package:store_app/features/review/data/models/review.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepo productRepo;
  ProductCubit({required this.productRepo}) : super(ProductInitial());

  double? total  = 0.0;


  Future getProductDetials(String id) async {
    emit(Loading());
    final results = await Future.wait([
      productRepo.getProductByID(id),
      productRepo.getProductReviws(id),
    ]);

    final productDetails = results[0];
    final productReview = results[1];

    late Product product;
    late Items reviw;

    bool hasError = false;
    ApiErrorModel? errorModel;

    productDetails.when(
      onSuccess: (data) {
        product = data as Product;
        total = data.price;
      },
      onError: (error) {
        hasError = true;
        errorModel = error;
      },
    );

    productReview.when(
      onSuccess: (data) {
        reviw = data as Items;
      },
      onError: (error) {
        hasError = true;
        errorModel = error;
      },
    );
    if (hasError) {
        emit(Faliuare(error: errorModel!));
      } else {
        emit(ProductSuccuss(
          product: product,
          review: reviw,
        ));
      }
  }



  Future getProductByID(String id) async {}
}
