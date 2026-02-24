import 'package:equatable/equatable.dart';
import 'package:filderstr/features/product/domain/entity/post_product_entity.dart';

abstract class PostProductEvent extends Equatable {
  const PostProductEvent();
  
  @override
  List<Object> get props => [];
}

class PostProductsEvent extends PostProductEvent {
  final PostProductEntity product;
  
  const PostProductsEvent(this.product);
  
  @override
  List<Object> get props => [product];
}