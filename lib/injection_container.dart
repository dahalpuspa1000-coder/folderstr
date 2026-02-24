import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:filderstr/core/network/api_client.dart';
import 'package:filderstr/core/network/network_info.dart';
import 'package:filderstr/core/storage/secure_storage.dart';
import 'package:filderstr/features/product/data/data_sources/post_product_datasource.dart';
import 'package:filderstr/features/product/data/data_sources/post_product_datasource_impl.dart';
import 'package:filderstr/features/product/data/data_sources/product_datasource.dart';
import 'package:filderstr/features/product/data/data_sources/product_datasource_impl.dart';
import 'package:filderstr/features/product/domain/repository/post_product_impl.dart';
import 'package:filderstr/features/product/domain/repository/post_product_repo.dart';
import 'package:filderstr/features/product/domain/repository/product_repo.dart';
import 'package:filderstr/features/product/domain/repository/product_repository_impl.dart';
import 'package:filderstr/features/product/domain/usecase/fetch_product_usecase.dart';
import 'package:filderstr/features/product/domain/usecase/post_product_usecase.dart';
import 'package:filderstr/features/product/presentation/bloc/post_bloc.dart';
import 'package:filderstr/features/product/presentation/bloc/product_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

final sl=GetIt.instance;
Future<void> registerDependcies()async{
//registering the external packages
sl.registerLazySingleton<Dio>(()=>Dio());
sl.registerLazySingleton<FlutterSecureStorage>(()=>FlutterSecureStorage());
sl.registerLazySingleton<Connectivity>(()=>Connectivity());
// core services
sl.registerLazySingleton<SecurePref>(()=>SecurePref(storage: sl<FlutterSecureStorage>()));
sl.registerLazySingleton<ApiClient>(()=>ApiClient(dio: sl<Dio>(), securePref: sl<SecurePref>()));
sl.registerLazySingleton<NetworkInfo>(()=>NetworkInfoImpl(sl<Connectivity>()));
// register the data source
sl.registerLazySingleton<ProductDatasource>(()=>ProductDatasourceImpl(sl<ApiClient>()));
sl.registerLazySingleton<PostProductDatasource>(()=>PostProductDatasourceImpl(sl<ApiClient>()));
//other data source can be registered here
sl.registerLazySingleton<ProductRepository>(()=>ProductRepositoryImpl(sl<ProductDatasource>(),sl<NetworkInfo>()));
sl.registerLazySingleton<PostProductRepository>(() => PostProductRepositoryImpl(sl<PostProductDatasource>(),sl<NetworkInfo>()),);
// usecase
sl.registerLazySingleton<FetchProductUsecase>(()=>FetchProductUsecase(sl<ProductRepository>()));
sl.registerLazySingleton<PostProductUsecase>(()=>PostProductUsecase(sl<PostProductRepository>()));
//bloc for the bloc register it is registered as registerFactory
sl.registerFactory<ProductBloc>(()=>ProductBloc(sl<FetchProductUsecase>()));
sl.registerLazySingleton<PostProductBloc>(()=>PostProductBloc(sl<PostProductUsecase>()));
}
