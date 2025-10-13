import 'package:equatable/equatable.dart';

class ItemsEntity extends Equatable {
  final String? id;
  final String? name;
  final double? price;
  final String? coverPictureUrl;
  final String? description;

  const ItemsEntity({
    this.id,
    this.description,
    this.name,
    this.price,
    this.coverPictureUrl,
  });

  @override
  List<Object?> get props => [id, name, price, coverPictureUrl];
}
