import 'package:dartz/dartz.dart';
import 'package:nova/core/api/api_consumer.dart';
import 'package:nova/core/api/api_exception.dart';
import 'package:nova/core/api/end_point.dart';
import 'package:nova/core/repositories/home_repo/home_repo.dart';
import 'package:nova/features/home/models/product_model.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiConsumer api;

  HomeRepoImpl({required this.api});

  @override
  Future<Either<Failure, List<ProductModel>>> getProducts() async {
    try {
      final response = await api.get(EndPoint.getProducts);
      final products = (response as List)
          .map((item) => ProductModel.fromJson(item as Map<String, dynamic>))
          .toList();
      return Right(products);
    } on Failure catch (f) {
      return Left(f);
    }
  }
}
