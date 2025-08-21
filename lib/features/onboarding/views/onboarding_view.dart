import 'package:flutter/material.dart';
import 'package:nova/core/functions/calc_padding.dart';
import 'package:nova/core/utils/app_colors.dart';
import 'package:nova/core/utils/assets.dart';
import 'package:nova/features/onboarding/widgets/drop_down_lang.dart';
import 'package:nova/features/onboarding/widgets/onboarding_card.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  static const double breakPoint = 500;

  @override
  Widget build(BuildContext context) {
    final hPadding = calcPadding(context);

    return Scaffold(
      backgroundColor: AppColors.primColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: hPadding, vertical: 25),
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < breakPoint) {
              return _verticalLayout();
            } else {
              return _horizontalLayout();
            }
          },
        ),
      ),
    );
  }

  Column _horizontalLayout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Align(alignment: Alignment.centerLeft, child: DropDownLang()),

        Expanded(
          child: Row(
            children: [
              Expanded(
                flex: 12,
                child: Image.asset(
                  Assets.assetsImagesOnBoardin,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(width: 20),

              const Expanded(flex: 10, child: OnboardingCard()),
            ],
          ),
        ),
      ],
    );
  }

  Column _verticalLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Align(alignment: Alignment.centerLeft, child: DropDownLang()),
        const SizedBox(height: 10),

        Expanded(
          flex: 6,
          child: Image.asset(Assets.assetsImagesOnBoardin, fit: BoxFit.fill),
        ),
        const SizedBox(height: 20),

        const Expanded(flex: 4, child: OnboardingCard()),
        const SizedBox(height: 50),
      ],
    );
  }
}
