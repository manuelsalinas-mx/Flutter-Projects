import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teslo_shop/features/products/presentation/providers/providers.dart';

import '../../domain/domain.dart';

// * * State Notifier Provider * * Hay que satisfacer ess 3 partes
// * #1 Creando el State
class ProductState {
  final String id;
  final Product? product;
  final bool isLoading;
  final bool isSaving;

  ProductState(
      {required this.id,
      this.product,
      this.isLoading = true,
      this.isSaving = false});

  ProductState copyWith({
    String? id,
    Product? product,
    bool? isLoading,
    bool? isSaving,
  }) =>
      ProductState(
        id: id ?? this.id,
        product: product ?? this.product,
        isLoading: isLoading ?? this.isLoading,
        isSaving: isSaving ?? this.isLoading,
      );
}

// * #2 Creando el Notifier
class ProductNotifier extends StateNotifier<ProductState> {
  final ProductsRepository productsRepository;

  ProductNotifier({required this.productsRepository, required String productId})
      : super(ProductState(id: productId)) {
    loadProduct();
  }

  Product _newEmptyProduct() {
    return Product(
      id: 'new',
      title: 'new product',
      price: 0,
      description: 'new description',
      slug: 'new_slug',
      stock: 0,
      sizes: ['S', 'M', 'L'],
      gender: 'men',
      tags: ['new tag'],
      images: [],
    );
  }

  Future<void> loadProduct() async {
    try {
      if (state.id == 'new') {
        state = state.copyWith(isLoading: false, product: _newEmptyProduct());
        return;
      }

      // retraso intencional para mostrar un loading
      await Future.delayed(const Duration(seconds: 1));

      final product = await productsRepository.getProductById(state.id);
      state = state.copyWith(isLoading: false, product: product);
    } catch (e) {
      state = state.copyWith(isLoading: false);
    }
  }
}

// * #3 Creando el Provider
final productProvider = StateNotifierProvider.autoDispose
    .family<ProductNotifier, ProductState, String>((ref, productId) {
  final productsRepository = ref.watch(productsRepositoryProvider);

  return ProductNotifier(
      productsRepository: productsRepository, productId: productId);
});
