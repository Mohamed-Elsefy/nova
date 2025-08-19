import 'package:flutter/material.dart';
import 'package:nova/core/router/router.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router(),
      title: 'NOVA',
      locale: const Locale('en', 'ar'),
      debugShowCheckedModeBanner: false,
    );
  }
}
