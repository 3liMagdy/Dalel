import 'package:equatable/equatable.dart';

enum OnBoardingNavigation { none, signUp, signIn }

class OnBoardingState extends Equatable {
  final int currentPage;
  final bool isLastPage;
  final OnBoardingNavigation navigation;

  const OnBoardingState({
    this.currentPage = 0,
    this.isLastPage = false,
    this.navigation = OnBoardingNavigation.none,
  });

  OnBoardingState copyWith({
    int? currentPage,
    bool? isLastPage,
    OnBoardingNavigation? navigation,
  }) {
    return OnBoardingState(
      currentPage: currentPage ?? this.currentPage,
      isLastPage: isLastPage ?? this.isLastPage,
      navigation: navigation ?? this.navigation,
    );
  }

  @override
  List<Object?> get props => [currentPage, isLastPage, navigation];
}
