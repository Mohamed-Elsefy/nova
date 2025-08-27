import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nova/core/router/router_keys.dart';
import 'package:nova/features/home/views/home_view.dart';
import 'package:nova/features/onboarding/cubit/onboarding_cubit.dart';
import 'package:nova/features/onboarding/views/onboarding_view.dart';

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
        builder: (context, state) => const HomeView(),
      ),
    ],
  );
}
