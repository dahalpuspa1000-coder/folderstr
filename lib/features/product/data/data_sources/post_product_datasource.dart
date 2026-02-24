import 'package:filderstr/features/product/data/model/post_product_model.dart';
import 'package:filderstr/features/product/domain/entity/post_product_entity.dart';

abstract class PostProductDatasource {
  Future<PostProductModel> postProduct(PostProductEntity product);
}