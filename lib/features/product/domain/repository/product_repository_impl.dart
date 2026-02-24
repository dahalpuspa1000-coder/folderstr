import 'package:dartz/dartz.dart';
import 'package:filderstr/core/error/failure.dart';
import 'package:filderstr/core/network/network_info.dart';
import 'package:filderstr/features/product/data/data_sources/product_datasource.dart';
import 'package:filderstr/features/product/domain/entity/products_entity.dart';
import 'package:filderstr/features/product/domain/repository/product_repo.dart';

class ProductRepositoryImpl implements ProductRepository{
  final ProductDatasource datasource;
  final NetworkInfo networkInfo;
  ProductRepositoryImpl(this.datasource,this.networkInfo);

  @override
  Future<Either<Failure, List<ProductEntity>>> fetchProducts()async {
    bool isConnected=await networkInfo.isConnected;
    if(!isConnected) return Left(NetworkFailure("No Internet connected"));
    try {
      final response =await datasource.getProducts();
      return Right (response);

    }
    catch(e){
      return Left(ServerFailure('$e'));
    }
  }}