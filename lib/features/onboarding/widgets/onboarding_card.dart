import 'package:flutter/material.dart';
import 'package:nova/core/utils/app_colors.dart';
import 'package:nova/core/utils/app_strings.dart';
import 'package:nova/core/utils/app_text_style.dart';

class OnboardingCard extends StatelessWidget {
  const OnboardingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(AppStrings.lookGood, style: AppTextStyle.h1),
          const SizedBox(height: 6),

          const Text(
            AppStrings.createYourIndiviual,
            textAlign: TextAlign.center,
            style: AppTextStyle.b3,
          ),
          const SizedBox(height: 30),

          SizedBox(
            width: 150,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primColor,
                padding: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {},
              child: const Text(AppStrings.next, style: AppTextStyle.b2),
            ),
          ),
        ],
      ),
    );
  }
}
