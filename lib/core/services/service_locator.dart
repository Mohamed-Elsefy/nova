import 'package:get_it/get_it.dart';
import 'package:nova/core/cache/cache_helper.dart';
import 'package:nova/core/cubit/locale_cubit.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<CacheHelper>(() => CacheHelper());
  getIt.registerLazySingleton<LocaleCubit>(() => LocaleCubit());
}
