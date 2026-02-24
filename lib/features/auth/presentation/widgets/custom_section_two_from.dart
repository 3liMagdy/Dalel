import 'package:dalel/core/functions/navigation.dart';
import 'package:dalel/core/functions/showToast.dart';
import 'package:dalel/core/routes/app_router.dart';
import 'package:dalel/core/utils/app_string.dart';
import 'package:dalel/core/widgets/custom_btn.dart';
import 'package:dalel/features/auth/presentation/manger/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/widgets/have_an_account_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Custom_section_two_feom extends StatelessWidget {
  const Custom_section_two_feom({super.key});

  @override
  Widget build(BuildContext context) {
    final double hight = MediaQuery.of(context).size.height;
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.isSuccess) {
          customshowToast(AppStrings.signInSuccess, Colors.green);
          customNavigatepushReplacement(context, AppRouter.kHomeRoute);
        } else if (state.errorMessage != null) {
          customshowToast(state.errorMessage!, Colors.red);
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            SizedBox(height: hight * 0.1338582677),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomBtn(
                text: AppStrings.signIn,
                onPressed: () {
                  context.read<AuthCubit>().signInWithEmailAndPassword();
                },
              ),
            ),
            SizedBox(height: 16),
            HaveAnAccountWidget(
              text1: AppStrings.dontHaveAnAccount,
              text2: AppStrings.signUp,
              onTap: () {
                customNavigatepushReplacement(context, AppRouter.kSignUpRoute);
              },
            ),
            SizedBox(height: 40),
          ],
        );
      },
    );
  }
}
