import 'package:nova/core/api/api_exception.dart';
import 'package:nova/features/home/models/product_model.dart';

class HomeState {}

final class HomeInitial extends HomeState {}

final class ProductsLoading extends HomeState {}

final class ProductsSuccess extends HomeState {
  final List<ProductModel> products;

  ProductsSuccess({required this.products});
}

final class ProductsFailure extends HomeState {
  final Failure failure;

  ProductsFailure({required this.failure});
}
