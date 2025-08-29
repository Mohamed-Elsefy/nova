import 'package:nova/core/api/end_point.dart';
import 'package:nova/features/home/models/category_model.dart';

class ProductModel {
  final int id;
  final String title;
  final String slug;
  final double price;
  final String description;
  final CategoryModel category;
  final List<String> images;

  ProductModel({
    required this.id,
    required this.title,
    required this.slug,
    required this.price,
    required this.description,
    required this.category,
    required this.images,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json[ApiKey.id],
      title: json[ApiKey.title],
      slug: json[ApiKey.slug],
      price: (json[ApiKey.price] as num).toDouble(),
      description: json[ApiKey.description],
      category: CategoryModel.fromJson(json[ApiKey.category]),
      images: (json[ApiKey.images] as List<dynamic>).cast<String>(),
    );
  }
}
