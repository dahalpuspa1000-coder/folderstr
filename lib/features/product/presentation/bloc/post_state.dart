import 'package:equatable/equatable.dart';
import 'package:filderstr/features/product/domain/entity/products_entity.dart';

abstract class PostProductState extends Equatable {
  const PostProductState();
  
  @override
  List<Object> get props => [];
}

class PostProductInitialState extends PostProductState {
  const PostProductInitialState();
}

class PostProductLoadingState extends PostProductState {}

class PostProductLoadedState extends PostProductState {
  final ProductEntity product;
  
  const PostProductLoadedState(this.product);
  
  @override
  List<Object> get props => [product];
}

class PostProductErrorState extends PostProductState {
  final String message;
  
  const PostProductErrorState(this.message);
  
  @override
  List<Object> get props => [message];
}