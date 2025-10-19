import 'package:e_commerce_app/features/home/data/models/category_model/category.dart';
import 'package:e_commerce_app/features/home/data/models/category_model/categorys.dart';
import 'package:e_commerce_app/features/home/domain/entities/category_entity.dart';

extension CategoryMapper on Category {
  CategoryEntity toEntity() {
    return CategoryEntity(
      id: id,
      name: name,
      description: description,
      coverPictureUrl: coverPictureUrl,
    );
  }
}

extension CategorysMapper on Categorys {
  CategorysEntity toEntity() {
    return CategorysEntity(
      categories: categories?.map((e) => e.toEntity()).toList() ?? [],
    );
  }
}
