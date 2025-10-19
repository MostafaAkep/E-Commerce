import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final String id;
  final String name;
  final String description;
  final String coverPictureUrl;
  const CategoryEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.coverPictureUrl,
  });
  @override
  List<Object?> get props => [id, name, description, coverPictureUrl];
}

class CategorysEntity extends Equatable {
  final List<CategoryEntity> categories;
  const CategorysEntity({required this.categories});
  @override
  List<Object?> get props => [categories];
}
