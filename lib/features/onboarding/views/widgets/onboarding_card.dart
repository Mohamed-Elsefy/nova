import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova/core/utils/app_text_style.dart';
import 'package:nova/core/widgets/button.dart';
import 'package:nova/core/widgets/circular_indicator.dart';
import 'package:nova/features/onboarding/cubit/onboarding_cubit.dart';
import 'package:nova/features/onboarding/cubit/onboarding_state.dart';
import 'package:nova/generated/l10n.dart';

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
          Text(S.of(context).lookGood, style: AppTextStyle.h2),
          const SizedBox(height: 6),

          Text(
            S.of(context).createYourIndiviual,
            textAlign: TextAlign.center,
            style: AppTextStyle.b3,
          ),
          const SizedBox(height: 30),

          BlocBuilder<OnboardingCubit, OnboardingState>(
            builder: (context, state) {
              if (state is OnboardingLoading) {
                return const CircularIndicator();
              }
              return ButtonW(
                title: S.of(context).getStart,
                onPressed: () =>
                    context.read<OnboardingCubit>().completeOnboarding(),
              );
            },
          ),
        ],
      ),
    );
  }
}
