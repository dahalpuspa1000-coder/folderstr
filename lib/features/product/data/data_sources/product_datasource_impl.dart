import 'package:dio/dio.dart';
import 'package:filderstr/core/constant/api_const.dart';
import 'package:filderstr/core/network/api_client.dart';
import 'package:filderstr/features/product/data/data_sources/product_datasource.dart';
import 'package:filderstr/features/product/data/model/product_model.dart';

class ProductDatasourceImpl implements ProductDatasource{
  final ApiClient apiClient;// variable define
  ProductDatasourceImpl(this.apiClient);
  @override
  Future<List<ProductModel>> getProducts() async {
    try{
      final response =await apiClient.dio.get(ApiConst.baseUrl+ApiConst.productsendpoint); 
      if(response.statusCode==200){
        final List <ProductModel>products=[];
        for(var product in response.data){
          products.add(ProductModel.fromJson(product));
        }
        return products;
        }
        throw DioException(requestOptions:response.requestOptions);
      }catch(e){
        if(e is DioException){
          rethrow;
        }
        throw DioException(
          requestOptions: RequestOptions(path: ''),
          response:Response(
             data:{'message':e.toString()},
             requestOptions: RequestOptions(path: ''),
             statusCode: 0,
          ),
          type: DioExceptionType.unknown,
          error: '"unknownErrorString":${e.toString()}',
        );
      }
    }
  }
 