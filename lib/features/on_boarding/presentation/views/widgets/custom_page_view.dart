import 'package:dalel/features/on_boarding/data/models/on_boarding_model.dart';
import 'package:dalel/features/on_boarding/presentation/views/widgets/custom_section_text.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({
    super.key,
    required this.controller,
    required this.onPageChanged,
  });

  final PageController controller;
  final Function(int) onPageChanged;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller,
      onPageChanged: onPageChanged,
      itemCount: onBoardingData.length,
      itemBuilder: (context, index) {
        final item = onBoardingData[index];

        return Column(
          children: [
            Expanded(
              child: Image.asset(
                item.imagePath,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 16),
            SmoothPageIndicator(
              controller: controller,
              count: onBoardingData.length,
            ),
            const SizedBox(height: 24),
            CustomSectionText(
              title: item.title,
              subTitle: item.subTitle,
            ),
          ],
        );
      },
    );
  }
}