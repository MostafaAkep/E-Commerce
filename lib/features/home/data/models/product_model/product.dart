import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:e_commerce_app/features/home/data/models/items_model/items.dart';

part 'product.g.dart';

@JsonSerializable()
class Product extends Equatable {
  final List<Items>? items;
  final int? page;
  final int? pageSize;
  final int? totalCount;
  final bool? hasNextPage;
  final bool? hasPreviousPage;

  const Product({
    this.items,
    this.page,
    this.pageSize,
    this.totalCount,
    this.hasNextPage,
    this.hasPreviousPage,
  });

  /// JSON serialization
  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  /// Value equality (for BLoC/state comparison)
  @override
  List<Object?> get props => [
    items,
    page,
    pageSize,
    totalCount,
    hasNextPage,
    hasPreviousPage,
  ];

  /// CopyWith for immutability
  Product copyWith({
    List<Items>? items,
    int? page,
    int? pageSize,
    int? totalCount,
    bool? hasNextPage,
    bool? hasPreviousPage,
  }) {
    return Product(
      items: items ?? this.items,
      page: page ?? this.page,
      pageSize: pageSize ?? this.pageSize,
      totalCount: totalCount ?? this.totalCount,
      hasNextPage: hasNextPage ?? this.hasNextPage,
      hasPreviousPage: hasPreviousPage ?? this.hasPreviousPage,
    );
  }
}
