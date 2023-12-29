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
  Future<Product> createUpdateProduct(Map<String, dynamic> productLike) async {
    try {
      // Si viene 'id' es update, sino viene es creacion
      final String? producId = productLike['id'];
      final String method = (producId == null) ? 'POST' : 'PATCH';
      final String url = (producId == null) ? '/post' : '/products/$producId';
      productLike.remove('id');

      final response =
          await dio.request(url, data: productLike, options: Options(method: method));
      return ProductMapper.jsonToEntity(response.data);

    } on DioError catch (e) {
      if (e.response?.statusCode == 404) throw ProductNotFound();
      throw Exception();
      
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<Product> getProductById(String id) async {
    try {
      final response = await dio.get('/products/$id');
      return ProductMapper.jsonToEntity(response.data);
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) throw ProductNotFound();
      throw Exception();
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<List<Product>> getProductsByPage(
      {int limit = 10, int offset = 0}) async {
    final response = await dio.get<List>('/products',
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
