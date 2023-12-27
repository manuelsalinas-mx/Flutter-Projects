import 'package:dio/dio.dart';
import 'package:teslo_shop/config/constants/environment.dart';
import 'package:teslo_shop/features/products/domain/domain.dart';
import '../infrastructure.dart';

class ProductsDatasourceImpl extends ProductsDatasource {
  late final Dio dio;
  final String accessToken;

  ProductsDatasourceImpl({required this.accessToken})
      : dio = Dio(BaseOptions(
            baseUrl: Environment.apiUrl,
            headers: {'Authorization': 'Bearer $accessToken'}));

  @override
  Future<Product> createUpdateProduct(Map<String, dynamic> productLike) {
    throw UnimplementedError();
  }

  @override
  Future<Product> getProductById(String id) async {
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> getProductsByPage({int limit = 10, int offset = 0}) async {
    final response = await dio.get<List>('/aoi/products',
        queryParameters: {'limit': limit, 'offset': offset});
    final List<Product> products = [];

    for (final prod in response.data ?? []) {
      products.add(ProductMapper.jsonToEntity(prod));
    }

    return products;
  }

  @override
  Future<List<Product>> searchProductsByTerm(String term) async {
    throw UnimplementedError();
  }
}
