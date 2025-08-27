class OnboardingState {}

final class OnboardingInitial extends OnboardingState {}

final class OnboardingLoading extends OnboardingState {}

final class OnboardingCompleted extends OnboardingState {}

final class OnboardingError extends OnboardingState {
  final String error;
  OnboardingError({required this.error});
}
