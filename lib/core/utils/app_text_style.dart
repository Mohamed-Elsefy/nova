import 'package:flutter/material.dart';

abstract class AppTextStyle {
  static const TextStyle h1 = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 26,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static const TextStyle h2 = TextStyle(
    fontFamily: 'Cairo',
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle b1 = TextStyle(
    fontFamily: 'Tajawal',
    fontSize: 18,
    height: 1,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle b2 = TextStyle(
    fontFamily: 'Tajawal',
    color: Colors.white,
    fontSize: 18,
  );
  static const TextStyle b3 = TextStyle(
    fontFamily: 'Tajawal',
    color: Colors.grey,
    fontSize: 14,
  );
}
