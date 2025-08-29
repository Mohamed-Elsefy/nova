import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova/core/repositories/home_repo/home_repo.dart';
import 'package:nova/features/home/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;

  HomeCubit(this.homeRepo) : super(HomeInitial());

  Future<void> getProducts() async {
    emit(ProductsLoading());
    final response = await homeRepo.getProducts();
    response.fold(
      (failure) => emit(ProductsFailure(failure: failure)),
      (products) => emit(ProductsSuccess(products: products)),
    );
  }
}
