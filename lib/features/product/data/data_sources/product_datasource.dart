import 'package:filderstr/features/product/data/model/product_model.dart';

abstract class ProductDatasource {
  Future<List<ProductModel>>getProducts();
  }
  
