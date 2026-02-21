

import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/features/on_boarding/presentation/views/widgets/custom_bottom_bar.dart';
import 'package:dalel/features/on_boarding/presentation/views/widgets/custom_nav_bar.dart';
import 'package:dalel/features/on_boarding/presentation/views/widgets/custom_section_text.dart';
import 'package:dalel/features/on_boarding/presentation/views/widgets/custom_smooth_page_indicator.dart';
import 'package:flutter/material.dart';

class OnBoardingWidgetBody extends StatelessWidget {
   const OnBoardingWidgetBody({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomNavBar(onTap: (){},),
        Image.asset(AppAssets.onBoarding1),
        const SizedBox(height:24 ,),
        CustomSmoothPageIndicator(controller: pageController),
        const SizedBox(height: 32),
        CustomSectionText(),
       CustomBottomBar(),
      ],
    );
  }
}