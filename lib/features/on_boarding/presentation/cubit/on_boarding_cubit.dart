import 'package:dalel/core/database/cache/cacheKeys.dart';
import 'package:dalel/core/database/cache/cache_helper.dart';
import 'package:dalel/core/services/service_locator.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'on_boarding_state.dart';

/// A Cubit that manages onboarding pages, navigation intents and the PageController.
class OnBoardingCubit extends Cubit<OnBoardingState> {
  final PageController _pageController;
  final int pagesCount;
  

  PageController get pageController => _pageController;

  OnBoardingCubit({
   
    this.pagesCount = 3,
  })  : _pageController = PageController(),
        super(const OnBoardingState()) {
    _emitPageState(0);
  }

  void _emitPageState(int page) {
    final last = page >= (pagesCount - 1);
    emit(state.copyWith(currentPage: page, isLastPage: last));
  }

  void onPageChanged(int page) => _emitPageState(page);

  Future<void> next() async {
    if (!state.isLastPage) {
      final nextPage = state.currentPage + 1;
      await _pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
      _emitPageState(nextPage);
    } else {
      await _completeOnBoarding();
      emit(state.copyWith(navigation: OnBoardingNavigation.signUp));
    }
  }

  Future<void> skip() async {
    await _completeOnBoarding();
    emit(state.copyWith(navigation: OnBoardingNavigation.signUp));
  }

  Future<void> login() async {
    await _completeOnBoarding();
    emit(state.copyWith(navigation: OnBoardingNavigation.signIn));
  }

  Future<void> _completeOnBoarding() async {
    await getIt<CacheHelper>().saveData(
      key: CacheKeys.onBoardingVisited,
      value: true,
    );
  }

  void clearNavigation() =>
      emit(state.copyWith(navigation: OnBoardingNavigation.none));

  @override
  Future<void> close() {
    _pageController.dispose();
    return super.close();
  }
}