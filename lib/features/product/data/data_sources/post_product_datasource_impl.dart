import 'package:dio/dio.dart';
import 'package:filderstr/core/constant/api_const.dart';
import 'package:filderstr/core/network/api_client.dart';
import 'package:filderstr/features/product/data/data_sources/post_product_datasource.dart';
import 'package:filderstr/features/product/data/model/post_product_model.dart';
import 'package:filderstr/features/product/domain/entity/post_product_entity.dart';

class PostProductDatasourceImpl implements PostProductDatasource {
  final ApiClient apiClient;
  
  PostProductDatasourceImpl(this.apiClient);

  @override
  Future<PostProductModel> postProduct(PostProductEntity product) async {
    try {
      final response = await apiClient.dio.post(
        ApiConst.baseUrl + ApiConst.postproductendpoint,
        data: product.toJson(),
      );
      
      if (response.statusCode == 200 || response.statusCode == 201) {
        return PostProductModel.fromJson(response.data);
      }
      throw DioException(requestOptions: response.requestOptions);
    } catch (e) {
      if (e is DioException) {
        rethrow;
      }
      throw DioException(
        requestOptions: RequestOptions(path: ''),
        response: Response(
          data: {'message': e.toString()},
          requestOptions: RequestOptions(path: ''),
          statusCode: 0,
        ),
        type: DioExceptionType.unknown,
        error: '"unknownErrorString":${e.toString()}',
      );
    }
  }
}