import 'package:e_commerce_app/features/home/data/models/items_model/items.dart';
import 'package:e_commerce_app/features/home/domain/entities/items_entity.dart';

extension ItemsMapper on Items {
  ItemsEntity toEntity() {
    return ItemsEntity(
      id: id,
      name: name,
      price: price,
      coverPictureUrl: coverPictureUrl,
    );
  }
}
