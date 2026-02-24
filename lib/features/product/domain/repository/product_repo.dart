import 'package:dartz/dartz.dart';
import 'package:filderstr/core/error/failure.dart';
import 'package:filderstr/features/product/domain/entity/post_product_entity.dart';
import 'package:filderstr/features/product/domain/entity/products_entity.dart';

abstract class ProductRepository {
  Future<Either<Failure,List<ProductEntity>>>fetchProducts();
    // Future<Either<Failure, ProductEntity>> postProduct(PostProductEntity product);
}
