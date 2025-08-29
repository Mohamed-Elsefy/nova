import 'package:flutter/material.dart';
import 'package:nova/core/utils/app_colors.dart';
import 'package:nova/core/utils/app_text_style.dart';
import 'package:nova/generated/l10n.dart';

class ErrorW extends StatelessWidget {
  const ErrorW({super.key, required this.error, required this.onPressed});
  final String error;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: AppColors.primColor,
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Icon(Icons.close, size: 50, color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(S.of(context).error, style: AppTextStyle.h2),
          Text(
            error,
            style: AppTextStyle.b1,
            textAlign: TextAlign.center,
            maxLines: 2,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 5),
          IconButton(
            onPressed: onPressed,
            icon: const Icon(Icons.refresh, size: 30),
          ),
        ],
      ),
    );
  }
}
