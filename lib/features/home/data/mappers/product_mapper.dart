import 'package:e_commerce_app/features/home/data/mappers/item_mapper.dart';
import 'package:e_commerce_app/features/home/data/models/product_model/product.dart';
import 'package:e_commerce_app/features/home/domain/entities/product_entity.dart';

extension ProductMapper on Product {
  ProductEntity toEntity() {
    return ProductEntity(
      items: items?.map((item) => item.toEntity()).toList(),
      page: page,
      pageSize: pageSize,
      totalCount: totalCount,
      hasNextPage: hasNextPage,
      hasPreviousPage: hasPreviousPage,
    );
  }
}
