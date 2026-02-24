import 'package:dartz/dartz.dart';
import 'package:filderstr/core/error/failure.dart';
import 'package:filderstr/core/usecase/usecase.dart';
import 'package:filderstr/features/product/domain/entity/products_entity.dart';
import 'package:filderstr/features/product/domain/repository/product_repo.dart';

class FetchProductUsecase extends UseCase<List<ProductEntity>, NoParams> {
  final ProductRepository repository;
  FetchProductUsecase(this.repository);
  @override
  Future<Either<Failure, List<ProductEntity>>> call(NoParams params) async {
    return await repository.fetchProducts();
  }
  
}
