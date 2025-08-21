import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nova/core/cache/cache_helper.dart';
import 'package:nova/core/cubit/locale_cubit.dart';
import 'package:nova/core/router/router.dart';
import 'package:nova/core/services/service_locator.dart';
import 'package:nova/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialApp();
  runApp(
    BlocProvider.value(value: getIt<LocaleCubit>(), child: const MainApp()),
  );
}

Future<void> initialApp() async {
  setupServiceLocator();
  await getIt<CacheHelper>().init();
  getIt<LocaleCubit>();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, Locale>(
      builder: (context, locale) {
        return MaterialApp.router(
          routerConfig: router(),
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
