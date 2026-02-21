import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'on_boarding_state.dart';

/// A Cubit that manages onboarding pages, navigation intents and the PageController.
class OnBoardingCubit extends Cubit<OnBoardingState> {
  final PageController _pageController;
  final int pagesCount;

  PageController get pageController => _pageController;

  OnBoardingCubit({this.pagesCount = 3})
      : _pageController = PageController(),
        super(OnBoardingState()) {
    // initialize isLastPage based on initial page
    _emitPageState(0);
  }

  void _emitPageState(int page) {
    final last = page >= (pagesCount - 1);
    emit(state.copyWith(currentPage: page, isLastPage: last));
  }

  /// Called by the PageView when the page changes (swipe)
  void onPageChanged(int page) => _emitPageState(page);

  /// Go to the next page if not last; otherwise emit navigation to sign-up
  Future<void> next() async {
    if (!state.isLastPage) {
      final nextPage = state.currentPage + 1;
      try {
        await _pageController.animateToPage(nextPage,
            duration: const Duration(milliseconds: 300), curve: Curves.ease);
      } catch (_) {}
      _emitPageState(nextPage);
    } else {
      // On finishing onboarding we prefer sign-up as default
      emit(state.copyWith(navigation: OnBoardingNavigation.signUp));
    }
  }

  /// User tapped skip -> request sign-up navigation
  void skip() => emit(state.copyWith(navigation: OnBoardingNavigation.signUp));

  /// User tapped login -> request sign-in navigation
  void login() => emit(state.copyWith(navigation: OnBoardingNavigation.signIn));

  /// Clear navigation intent after UI handled navigation
  void clearNavigation() => emit(state.copyWith(navigation: OnBoardingNavigation.none));

  @override
  Future<void> close() {
    _pageController.dispose();
    return super.close();
  }
}
