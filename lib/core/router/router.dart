import 'package:go_router/go_router.dart';
import 'package:nova/core/router/router_keys.dart';
import 'package:nova/features/onboarding/onboarding.dart';

GoRouter router() {
  return GoRouter(
    routes: [
      GoRoute(
        path: RouterKeys.onBoarding,
        builder: (context, state) => const Onboarding(),
      ),
    ],
  );
}
