

import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/features/auth/presentation/manger/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Checkbox(
          value: state.isTermsAccepted,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4)),
          side: BorderSide(color: AppColors.grey),
          onChanged: (newValue) {
            context
                .read<AuthCubit>()
                .updateTermsAndConditionCheckBox(
                    newValue: newValue ?? false);
          },
        );
      },
    );
  }
}