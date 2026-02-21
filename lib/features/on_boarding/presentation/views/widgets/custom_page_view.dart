import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/features/on_boarding/presentation/views/widgets/custom_section_text.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:dalel/core/utils/app_colors.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({super.key, required this.controller, this.onPageChanged});
  final PageController controller;
  final Function(int)? onPageChanged;

  @override
  Widget build(BuildContext context) {
     final height = MediaQuery.of(context).size.height;
      final width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: height * 0.75,
      child: PageView.builder(
        onPageChanged: onPageChanged,
        physics: const BouncingScrollPhysics(),
        controller: controller,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: height * 0.36,
                width: width * 0.95,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      AppAssets.onBoarding1,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: ExpandingDotsEffect(
                  activeDotColor: AppColors.deepBrown,
                  dotHeight: 7,
                  dotWidth: 10,
                ),
              ),
              const SizedBox(height: 32),
              const CustomSectionText(),
              
            ],
          );
        },
      ),
    );
  }
}
