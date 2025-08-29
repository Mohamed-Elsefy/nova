import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nova/core/api/dio_consumer.dart';
import 'package:nova/core/repositories/home_repo/home_repo_impl.dart';
import 'package:nova/core/router/router_keys.dart';
import 'package:nova/core/services/service_locator.dart';
import 'package:nova/features/home/cubit/home_cubit.dart';
import 'package:nova/features/home/views/home_view.dart';
import 'package:nova/features/onboarding/cubit/onboarding_cubit.dart';
import 'package:nova/features/onboarding/views/onboarding_view.dart';

final DioConsumer _dioCons = getIt<DioConsumer>();

GoRouter router({required String initialLocation}) {
  return GoRouter(
    initialLocation: initialLocation,
    routes: [
      GoRoute(
        path: RouterKeys.onBoarding,
        builder: (context, state) => BlocProvider(
          create: (context) => OnboardingCubit(),
          child: const OnboardingView(),
        ),
      ),

      GoRoute(
        path: RouterKeys.home,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              HomeCubit(HomeRepoImpl(api: _dioCons))..getProducts(),
          child: const HomeView(),
        ),
      ),
    ],
  );
}
