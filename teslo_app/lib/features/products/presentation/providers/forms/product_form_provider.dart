import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:teslo_shop/config/constants/environment.dart';
import '../../../../shared/shared.dart';
import '../../../domain/domain.dart';

// * * State Notifier Provider * * Hay que satisfacer ess 3 partes
// * #1 Creando el State
class ProductFormState {
  final bool isFormValid;
  final String? id;
  final Title title;
  final Slug slug;
  final Price price;
  final Stock inStock;
  final List<String> sizes;
  final String gender;
  final String description;
  final String tags;
  final List<String> images;

  ProductFormState(
      {this.isFormValid = false,
      this.id,
      this.title = const Title.dirty(''),
      this.slug = const Slug.dirty(''),
      this.price = const Price.dirty(0),
      this.inStock = const Stock.dirty(0),
      this.sizes = const [],
      this.gender = '',
      this.description = '',
      this.tags = '',
      this.images = const []});

  ProductFormState copyWith(
          {bool? isFormValid,
          String? id,
          Title? title,
          Slug? slug,
          Price? price,
          Stock? inStock,
          List<String>? sizes,
          String? gender,
          String? description,
          String? tags,
          List<String>? images}) =>
      ProductFormState(
          isFormValid: isFormValid ?? this.isFormValid,
          id: id ?? this.id,
          title: title ?? this.title,
          slug: slug ?? this.slug,
          price: price ?? this.price,
          inStock: inStock ?? this.inStock,
          sizes: sizes ?? this.sizes,
          gender: gender ?? this.gender,
          description: description ?? this.description,
          tags: tags ?? this.tags,
          images: images ?? this.images);
}

// * #2 Creando el Notifier
class ProductFormNotifier extends StateNotifier<ProductFormState> {
  final void Function(Map<String, dynamic> productLike)? onSubmitCallback;

  ProductFormNotifier({this.onSubmitCallback, required Product product})
      : super(ProductFormState(
            id: product.id,
            title: Title.dirty(product.title),
            slug: Slug.dirty(product.slug),
            price: Price.dirty(product.price),
            inStock: Stock.dirty(product.stock),
            sizes: product.sizes,
            gender: product.gender,
            description: product.description,
            tags: product.tags.join(', '),
            images: product.images));

  Future<bool> onFormSubmit() async {
    _validatingAllFields();
    if (!state.isFormValid) return false;
    if (onSubmitCallback == null) return false;

    final productLike = {
      'title': state.title.value,
      'price': state.price.value,
      'description': state.description,
      'slug': state.slug.value,
      'stock': state.inStock.value,
      'sizes': state.sizes,
      'gender': state.gender,
      'tags': state.tags.split(','),
      'images': state.images
          .map((img) =>
              img.replaceAll('${Environment.apiUrl}/files/product/', ''))
          .toList()
    };

    return true;

    //TODO: llamar onsubmit callback
  }

  void _validatingAllFields() {
    state = state.copyWith(
        isFormValid: Formz.validate([
      Title.dirty(state.title.value),
      Slug.dirty(state.slug.value),
      Price.dirty(state.price.value),
      Stock.dirty(state.inStock.value),
    ]));
  }

  void onTitleChanged(String value) {
    state = state.copyWith(
        title: Title.dirty(value),
        isFormValid: Formz.validate([
          Title.dirty(value),
          Slug.dirty(state.slug.value),
          Price.dirty(state.price.value),
          Stock.dirty(state.inStock.value),
        ]));
  }

  void onSlugChanged(String value) {
    state = state.copyWith(
        slug: Slug.dirty(value),
        isFormValid: Formz.validate([
          Title.dirty(state.title.value),
          Slug.dirty(value),
          Price.dirty(state.price.value),
          Stock.dirty(state.inStock.value),
        ]));
  }

  void onPriceChanged(double value) {
    state = state.copyWith(
        price: Price.dirty(value),
        isFormValid: Formz.validate([
          Title.dirty(state.title.value),
          Slug.dirty(state.slug.value),
          Price.dirty(value),
          Stock.dirty(state.inStock.value),
        ]));
  }

  void onStockChanged(int value) {
    state = state.copyWith(
        inStock: Stock.dirty(value),
        isFormValid: Formz.validate([
          Title.dirty(state.title.value),
          Slug.dirty(state.slug.value),
          Price.dirty(state.price.value),
          Stock.dirty(value),
        ]));
  }

  void onSizesChanged(List<String> sizes) {
    state = state.copyWith(sizes: sizes);
  }

  void onGenderChanged(String value) {
    state = state.copyWith(gender: value);
  }

  void onDescriptionChanged(String value) {
    state = state.copyWith(description: value);
  }

  void onTagsChanged(String value) {
    state = state.copyWith(tags: value);
  }
}

// * #3 Creando el Provider (StateNotifierProvider)
final productFormProvider =
    StateNotifierProvider.autoDispose.family<ProductFormNotifier, ProductFormState, Product>((ref, product) {
//TODO: Create update callback
  return ProductFormNotifier(product: product);
});
