import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova/core/cache/cache_helper.dart';
import 'package:nova/core/cache/cache_key.dart';
import 'package:nova/core/services/service_locator.dart';
import 'package:nova/features/onboarding/cubit/onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());

  Future<void> completeOnboarding() async {
    try {
      emit(OnboardingLoading());
      await getIt<CacheHelper>().saveData(
        key: CacheKeys.onboarded,
        value: true,
      );
      emit(OnboardingCompleted());
    } catch (e) {
      emit(OnboardingError(error: e.toString()));
    }
  }
}
