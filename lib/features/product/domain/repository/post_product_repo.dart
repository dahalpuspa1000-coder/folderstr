import 'package:dartz/dartz.dart';
import 'package:filderstr/core/error/failure.dart';
import 'package:filderstr/features/product/domain/entity/products_entity.dart';
import 'package:filderstr/features/product/domain/entity/post_product_entity.dart';

abstract class PostProductRepository{
 // Future<Either<Failure, List<ProductEntity>>> fetchProducts();
  Future<Either<Failure, ProductEntity>> postProduct(PostProductEntity product);
}