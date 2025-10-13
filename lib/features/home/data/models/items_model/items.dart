import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'items.g.dart';

@JsonSerializable()
class Items extends Equatable {
  final String? id;
  final String? productCode;
  final String? name;
  final String? description;
  final String? arabicName;
  final String? arabicDescription;
  final String? coverPictureUrl;
  final List<String>? productPictures;
  final double? price;
  final int? stock;
  final double? weight;
  final String? color;
  final double? rating;
  final int? reviewsCount;
  final int? discountPercentage;
  final String? sellerId;
  final List<String>? categories;

  const Items({
    this.id,
    this.productCode,
    this.name,
    this.description,
    this.arabicName,
    this.arabicDescription,
    this.coverPictureUrl,
    this.productPictures,
    this.price,
    this.stock,
    this.weight,
    this.color,
    this.rating,
    this.reviewsCount,
    this.discountPercentage,
    this.sellerId,
    this.categories,
  });

  /// JSON serialization
  factory Items.fromJson(Map<String, dynamic> json) =>
      _$ItemsFromJson(json);
  Map<String, dynamic> toJson() => _$ItemsToJson(this);

  /// Equatable for value comparison
  @override
  List<Object?> get props => [
    id,
    productCode,
    name,
    description,
    arabicName,
    arabicDescription,
    coverPictureUrl,
    productPictures,
    price,
    stock,
    weight,
    color,
    rating,
    reviewsCount,
    discountPercentage,
    sellerId,
    categories,
  ];

  /// CopyWith method for immutability
  Items copyWith({
    String? id,
    String? productCode,
    String? name,
    String? description,
    String? arabicName,
    String? arabicDescription,
    String? coverPictureUrl,
    List<String>? productPictures,
    double? price,
    int? stock,
    double? weight,
    String? color,
    double? rating,
    int? reviewsCount,
    int? discountPercentage,
    String? sellerId,
    List<String>? categories,
  }) {
    return Items(
      id: id ?? this.id,
      productCode: productCode ?? this.productCode,
      name: name ?? this.name,
      description: description ?? this.description,
      arabicName: arabicName ?? this.arabicName,
      arabicDescription: arabicDescription ?? this.arabicDescription,
      coverPictureUrl: coverPictureUrl ?? this.coverPictureUrl,
      productPictures: productPictures ?? this.productPictures,
      price: price ?? this.price,
      stock: stock ?? this.stock,
      weight: weight ?? this.weight,
      color: color ?? this.color,
      rating: rating ?? this.rating,
      reviewsCount: reviewsCount ?? this.reviewsCount,
      discountPercentage:
          discountPercentage ?? this.discountPercentage,
      sellerId: sellerId ?? this.sellerId,
      categories: categories ?? this.categories,
    );
  }
}
