// * * State Notifier Provider * * Hay que satisfacer ess 3 partes
// * #1 Creando el State
import '../../../../shared/shared.dart';

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
        images: images ?? this.images
      );
}


// * #2 Creando el Notifier


// * #3 Creando el Provider