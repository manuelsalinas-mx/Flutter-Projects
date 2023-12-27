// El objetvo de este provider es establecer a lo largo de la app,
//la instancia de nuestro products repository implementation

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teslo_shop/features/auth/presentation/providers/auth_provider.dart';
import 'package:teslo_shop/features/products/infrastructure/infrastructure.dart';
import '../../domain/domain.dart';

final productsRepositoryProvider = Provider<ProductsRepository>((ref) {
  final accessToken = ref.watch(authProvider).user?.token ?? '';
  final productsRepository =
      ProductsRepositoryImpl(ProductsDatasourceImpl(accessToken: accessToken));
  
  return productsRepository;
});
