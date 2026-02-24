



import 'package:dalel/core/functions/navigation.dart';
import 'package:dalel/core/routes/app_router.dart';
import 'package:dalel/core/utils/app_string.dart';
import 'package:dalel/core/widgets/custom_btn.dart';
import 'package:dalel/features/auth/presentation/manger/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BottomNavigationBarForgotPassword extends StatelessWidget {
  const BottomNavigationBarForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 60),
          child: CustomBtn(
            text: AppStrings.sendVerificationCode,
            onPressed: () {
             context.go(AppRouter.kVerificationRoute);
            },
          ),
        );
      },
    );
  }
}