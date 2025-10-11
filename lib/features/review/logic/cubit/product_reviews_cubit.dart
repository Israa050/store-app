import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/networking/api_error_model.dart';
import 'package:store_app/features/review/data/models/review.dart';
import 'package:store_app/features/review/data/repos/product_review_repo.dart';

part 'product_reviews_state.dart';

class ProductReviewsCubit extends Cubit<ProductReviewsState> {
  final ProductReviewRepo productReviewRepo;
  ProductReviewsCubit({required this.productReviewRepo}) : super(ProductReviewsInitial());

  Future getProductReviws(String id)async{
    emit(Loading());
    final results = await productReviewRepo.getProductReviews(id);
    results.when(onSuccess: (data){
      emit(ProductReviwSuccess(reviews: data));
    }, onError: (error){
      emit(Faliure(error: error));
    });

  }
}
