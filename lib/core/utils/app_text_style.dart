import 'package:flutter/material.dart';

abstract class AppTextStyle {
  static const TextStyle h1 = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle b2 = TextStyle(
    fontFamily: 'PlayfairDisplay',
    color: Colors.white,
    fontSize: 18,
  );
  static const TextStyle b3 = TextStyle(
    fontFamily: 'PlayfairDisplay',
    color: Colors.grey,
    fontSize: 14,
  );
}
