import 'package:flutter/material.dart';

class IconButtonW extends StatelessWidget {
  const IconButtonW({
    super.key,
    required this.iconData,
    required this.onPressed,
  });
  final IconData iconData;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onPressed, icon: Icon(iconData, size: 32));
  }
}
