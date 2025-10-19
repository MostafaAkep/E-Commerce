import 'package:e_commerce_app/features/home/data/models/category_model/category.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'categorys.g.dart';

@JsonSerializable()
class Categorys extends Equatable {
  final List<Category>? categories;
  Categorys({this.categories});

  factory Categorys.fromJson(Map<String, dynamic> json) =>
      _$CategorysFromJson(json);
  Map<String, dynamic> toJson() => _$CategorysToJson(this);
  @override
  List<Object?> get props => [categories];
}
