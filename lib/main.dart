import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:nova/core/cache/cache_helper.dart';
import 'package:nova/core/cache/cache_key.dart';
import 'package:nova/core/cubit/locale_cubit.dart';
import 'package:nova/core/router/router.dart';
import 'package:nova/core/router/router_keys.dart';
import 'package:nova/core/services/service_locator.dart';
import 'package:nova/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialApp();

  // if onboarding is visited then true else false
  final onboarded =
      await getIt<CacheHelper>().getData(key: CacheKeys.onboarded) ?? false;

  final appRouter = router(
    initialLocation: onboarded ? RouterKeys.home : RouterKeys.onBoarding,
  );

  runApp(
    BlocProvider.value(
      value: getIt<LocaleCubit>(),
      child: MainApp(router: appRouter),
    ),
  );
}

Future<void> initialApp() async {
  setupServiceLocator();
  await getIt<CacheHelper>().init();
  getIt<LocaleCubit>();
}

class MainApp extends StatelessWidget {
  final GoRouter router;

  const MainApp({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, Locale>(
      builder: (context, locale) {
        return MaterialApp.router(
          routerConfig: router,
          title: 'NOVA',
          locale: locale,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
