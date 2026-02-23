


import 'package:dalel/core/functions/navigation.dart';
import 'package:dalel/core/routes/app_router.dart';
import 'package:dalel/core/utils/app_string.dart';
import 'package:dalel/core/widgets/custom_btn.dart';
import 'package:dalel/features/auth/presentation/widgets/have_an_account_widget.dart';
import 'package:flutter/material.dart';

class Custom_section_two_feom extends StatelessWidget {
  const Custom_section_two_feom({super.key});

  @override
  Widget build(BuildContext context) {
     final double hight = MediaQuery.of(context).size.height;
    return Column(
      children: [
 SizedBox(height: hight * 0.1338582677),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomBtn(
              text: AppStrings.signIn,
              onPressed: () {
                customNavigatepushReplacement(context, AppRouter.kHomeRoute);
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
  }
}