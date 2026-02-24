// Create new file: post_product_repository.dart
import 'package:dartz/dartz.dart';
import 'package:filderstr/core/error/failure.dart';
import 'package:filderstr/core/network/network_info.dart';
import 'package:filderstr/features/product/data/data_sources/post_product_datasource.dart';
import 'package:filderstr/features/product/domain/entity/post_product_entity.dart';
import 'package:filderstr/features/product/domain/entity/products_entity.dart';
import 'package:filderstr/features/product/domain/repository/post_product_repo.dart';
class PostProductRepositoryImpl implements PostProductRepository {
  final PostProductDatasource postProductDatasource;
  final NetworkInfo networkInfo;
  
  PostProductRepositoryImpl(this.postProductDatasource, this.networkInfo);

  @override
  Future<Either<Failure, ProductEntity>> postProduct(PostProductEntity params) async {
    bool isConnected = await networkInfo.isConnected;
    if (!isConnected) return Left(NetworkFailure("No Internet connected"));
    try {
      final response = await postProductDatasource.postProduct(params);
      return Right(response as ProductEntity);
    } catch (e) {
      return Left(ServerFailure('$e'));
    }
  }
}