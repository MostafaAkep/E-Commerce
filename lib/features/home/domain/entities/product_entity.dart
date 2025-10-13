import 'package:equatable/equatable.dart';
import 'items_entity.dart';

class ProductEntity extends Equatable {
  final List<ItemsEntity>? items;
  final int? page;
  final int? pageSize;
  final int? totalCount;
  final bool? hasNextPage;
  final bool? hasPreviousPage;

  const ProductEntity({
    this.items,
    this.page,
    this.pageSize,
    this.totalCount,
    this.hasNextPage,
    this.hasPreviousPage,
  });

  @override
  List<Object?> get props => [
    items,
    page,
    pageSize,
    totalCount,
    hasNextPage,
    hasPreviousPage,
  ];
}
