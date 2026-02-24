import 'package:filderstr/features/product/presentation/bloc/post_event.dart';
import 'package:filderstr/features/product/presentation/bloc/post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:filderstr/features/product/domain/usecase/post_product_usecase.dart';

class PostProductBloc extends Bloc<PostProductEvent, PostProductState> {
  final PostProductUsecase postProductUsecase;
  
  PostProductBloc(this.postProductUsecase) : super(const PostProductInitialState()) {
    on<PostProductsEvent>(_onPostProductEvent);
  }
  
  void _onPostProductEvent(
    PostProductsEvent event,
    Emitter<PostProductState> emit,
  ) async {
    emit(PostProductLoadingState());
    
    final result = await postProductUsecase.call(event.product);
    
    result.fold(
      (failure) {
        emit(PostProductErrorState(failure.message));
      },
      (product) {
        emit(PostProductLoadedState(product));
      },
    );
  }
}