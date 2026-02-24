import 'package:dartz/dartz.dart';
import 'package:filderstr/core/error/failure.dart';
import 'package:filderstr/core/usecase/usecase.dart';
import 'package:filderstr/features/product/domain/entity/post_product_entity.dart';
import 'package:filderstr/features/product/domain/entity/products_entity.dart';
import 'package:filderstr/features/product/domain/repository/post_product_repo.dart';

class PostProductUsecase extends UseCase<ProductEntity, PostProductEntity> {
  final PostProductRepository repository;
  
  PostProductUsecase(this.repository);
  
  @override
  Future<Either<Failure, ProductEntity>> call(PostProductEntity params) async {
    return await repository.postProduct(params);
  }
}
