import 'package:dalel/features/on_boarding/presentation/views/widgets/custom_bottom_bar.dart';
import 'package:dalel/features/on_boarding/presentation/views/widgets/custom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:dalel/features/on_boarding/presentation/views/widgets/custom_page_view.dart';

class OnBoardingWidgetBody extends StatelessWidget {
  const OnBoardingWidgetBody({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        children: [
          const SizedBox(height: 40),
          CustomNavBar(onTap: () {}),
          CustomPageView(controller: pageController),
           const SizedBox(height: 88),
         
          CustomBottomBar(onTap: () {},),
        ],
      ),
    );
  }
}
