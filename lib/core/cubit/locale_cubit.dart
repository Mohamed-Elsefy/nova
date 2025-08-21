import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova/core/cache/cache_helper.dart';
import 'package:nova/core/cache/cache_key.dart';
import 'package:nova/core/services/service_locator.dart';

class LocaleCubit extends Cubit<Locale> {
  LocaleCubit() : super(_readSavedLocale());

  static Locale _readSavedLocale() {
    try {
      final lang = getIt<CacheHelper>().getData(key: CacheKeys.lang) as String?;
      return Locale(lang ?? 'en');
    } catch (_) {
      return const Locale('en');
    }
  }

  Future<void> setLocale(Locale locale) async {
    if (locale == state) return;
    emit(locale);
    try {
      await getIt<CacheHelper>().saveData(
        key: CacheKeys.lang,
        value: locale.languageCode,
      );
    } catch (e) {
      // optional: handle error or logging
    }
  }
}
