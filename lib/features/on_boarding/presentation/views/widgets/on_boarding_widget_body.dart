import 'package:dalel/features/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:dalel/features/on_boarding/presentation/views/widgets/custom_bottom_bar.dart';
import 'package:dalel/features/on_boarding/presentation/views/widgets/custom_nav_bar.dart';
import 'package:dalel/features/on_boarding/presentation/views/widgets/custom_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingWidgetBody extends StatelessWidget {
  const OnBoardingWidgetBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OnBoardingCubit>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 40),

          CustomNavBar(
            onTap: () => cubit.skip(),
          ),

          Expanded(
            child: CustomPageView(
              controller: cubit.pageController,
              onPageChanged: cubit.onPageChanged,
            ),
          ),

          const SizedBox(height: 24),

          const CustomBottomBar(),

          const SizedBox(height: 24),
        ],
      ),
    );
  }
}