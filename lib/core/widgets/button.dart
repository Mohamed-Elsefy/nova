import 'package:flutter/material.dart';
import 'package:nova/core/utils/app_colors.dart';
import 'package:nova/core/utils/app_text_style.dart';

class ButtonW extends StatelessWidget {
  final String title;
  final Function() onPressed;
  const ButtonW({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primColor,
          padding: const EdgeInsets.only(left: 8, right: 8, top: 10, bottom: 4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onPressed,
        child: Text(title, style: AppTextStyle.b2),
      ),
    );
  }
}
