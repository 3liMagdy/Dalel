

import 'package:dalel/features/on_boarding/presentation/views/widgets/on_boarding_widget_body.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatelessWidget {
   OnBoardingView({super.key});
  final PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:OnBoardingWidgetBody(pageController: pageController),
    );
  }
}