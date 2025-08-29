import 'package:dartz/dartz.dart';
import 'package:nova/core/api/api_exception.dart';
import 'package:nova/features/home/models/product_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<ProductModel>>> getProducts();
}
