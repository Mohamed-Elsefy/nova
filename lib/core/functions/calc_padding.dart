import 'package:flutter/material.dart';

double calcPadding(BuildContext context) {
  final size = MediaQuery.sizeOf(context);
  return (size.width * .048).toDouble();
}
