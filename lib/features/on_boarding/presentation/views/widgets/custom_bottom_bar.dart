import 'package:dalel/core/utils/app_string.dart';
import 'package:dalel/core/widgets/custom_btn.dart';
import 'package:dalel/features/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:dalel/features/on_boarding/presentation/cubit/on_boarding_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
      builder: (context, state) {
        final cubit = context.read<OnBoardingCubit>();

        if (state.isLastPage) {
          return Column(
            children: [
              CustomBtn(
                text: AppStrings.createAccount,
                onPressed: cubit.next,
              ),
              const SizedBox(height: 16),
              CustomBtn(
                text: AppStrings.loginNow,
                onPressed: cubit.login,
              ),
            ],
          );
        }

        return CustomBtn(
          text: AppStrings.next,
          onPressed: cubit.next,
        );
      },
    );
  }
}